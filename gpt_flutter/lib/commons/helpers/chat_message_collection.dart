import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';

class ChatMessageCollection implements List<ChatMessage> {
  final _chatMessageList = <ChatMessage>[];

  @override
  List<ChatMessage> add(ChatMessage message) {
    removeElement();
    _chatMessageList.add(message);
    return _chatMessageList;
  }

  List<ChatMessage> getList() => _chatMessageList;

  void removeElement() {
    if (_chatMessageList.isNotEmpty && _chatMessageList.length == 20) {
      _chatMessageList.removeAt(0);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
