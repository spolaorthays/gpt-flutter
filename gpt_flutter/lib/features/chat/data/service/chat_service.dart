import 'package:dio/dio.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';

abstract class ChatService {
  Future<void> getListModel();
  Future<void> getChat();
}

class ChatServiceImpl implements ChatService {
  final Dio client;

  ChatServiceImpl(this.client);

  @override
  Future<ChatModel> getChat() {
    // TODO: implement getChat
    throw UnimplementedError();
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

//
//