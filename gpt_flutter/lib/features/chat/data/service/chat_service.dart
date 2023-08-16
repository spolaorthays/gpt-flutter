import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:injectable/injectable.dart';

abstract class ChatService {
  Future<void> getListModel();
  Future<ChatResponse> getChatConversation(ChatRequest request);
}

@Injectable(as: ChatService)
class ChatServiceImpl implements ChatService {
  final Dio client;

  ChatServiceImpl(this.client);

  @override
  Future<ChatResponse> getChatConversation(ChatRequest request) async {
    final response = await client.post(
      'chat/completions',
      data: request,
    );

    if (response.statusCode == 200) {
      return ChatResponse.fromJson(response.data);
    }

    throw const HttpException('Fail to get conversation');
  }

  @override
  Future<void> getListModel() async {
    final response = await client.get(
      'models',
    );
    print('Response: ${response.data}');
    print('Status code: ${response.statusCode}');
  }
}

// Lista de modelos. Precisamos escolher um deles para utilizar na interação do chat
//GET https://api.openai.com/v1/models

//Conversação
//POST https://api.openai.com/v1/chat/completions