import 'package:equatable/equatable.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatRequestEvent extends ChatEvent {
  const ChatRequestEvent(this.request);

  final ChatRequest request;

  @override
  List<Object> get props => [request];
}

class UserMessageEvent extends ChatEvent {
  const UserMessageEvent(this.message);

  final ChatMessage message;

  @override
  List<Object> get props => [message];
}
