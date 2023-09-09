import 'package:gpt_flutter/features/chat/data/service/chat_service.dart';
import 'package:injectable/injectable.dart';

import '../data/model/chat_model.dart';
import '../data/model/choice_chat_bot_model.dart';

abstract class ChatInteractor {
  Future<ChatBotResponse> getListModel();
  Future<ChatResponse> getChatConversation(ChatRequest request);
}

@Injectable(as: ChatInteractor)
class ChatInteractorImpl implements ChatInteractor {
  final ChatService _service;

  ChatInteractorImpl(this._service);

  @override
  Future<ChatResponse> getChatConversation(ChatRequest request) async {
    return _service.getChatConversation(request);
  }

  @override
  Future<ChatBotResponse> getListModel() async {
    return _service.getListModel();
  }
}
