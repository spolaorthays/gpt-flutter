import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:injectable/injectable.dart';

import '../model/choice_chat_bot_model.dart';

abstract class ChatService {
  Future<ChatBotResponse> getListModel();
  Future<ChatResponse> getChatConversation(ChatRequest request);
}

@Injectable(as: ChatService)
class ChatServiceImpl implements ChatService {
  final Dio client;

  ChatServiceImpl(this.client);

  @override
  Future<ChatResponse> getChatConversation(ChatRequest request) async {
    final objectToJson = jsonEncode(request.toJson());

    print('Request: $objectToJson');

    final response = await client.post(
      'chat/completions',
      data: objectToJson,
    );

    print('Response: ${response.data}');

    if (response.statusCode == 200) {
      return ChatResponse.fromJson(response.data);
    }

    throw const HttpException('Fail to get conversation');
  }

  @override
  Future<ChatBotResponse> getListModel() async {
    final response = await client.get(
      'models',
    );

    if (response.statusCode == 200) {
      return ChatBotResponse.fromJson(response.data);
    }
    print('Response: ${response.data}');
    print('Status code: ${response.statusCode}');

    throw const HttpException('Fail to chatbot models');
  }
}

// Lista de modelos. Precisamos escolher um deles para utilizar na interação do chat
//GET https://api.openai.com/v1/models

//Conversação
//POST https://api.openai.com/v1/chat/completions