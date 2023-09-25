import 'package:equatable/equatable.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';

enum ChatResultState { empty, loading, error, success }

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final ChatResultState resultState;

  const ChatState({
    this.messages = const <ChatMessage>[],
    this.resultState = ChatResultState.empty,
  });

  @override
  List<Object?> get props => [
        messages,
        resultState,
      ];

  ChatState copyWith(
          {ChatRequest? request,
          List<ChatMessage>? messages,
          ChatResultState? resultState}) =>
      ChatState(
        messages: messages ?? this.messages,
        resultState: resultState ?? this.resultState,
      );
}
