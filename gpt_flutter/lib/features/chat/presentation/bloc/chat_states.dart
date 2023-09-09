import 'package:equatable/equatable.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';

enum ChatResultState { empty, loading, error, success }

class ChatState extends Equatable {
  final ChatRequest? request;
  final List<ChatMessage> messages;
  final ChatResultState resultState;

  const ChatState({
    this.request,
    //= const ChatRequest(
    //  'gpt-3.5-turbo-16k-0613', [ChatMessage('user', 'Hello')]),
    this.messages = const <ChatMessage>[],
    this.resultState = ChatResultState.empty,
  });

  @override
  List<Object?> get props => [request, messages, resultState];

  ChatState copyWith(
          {ChatRequest? request,
          List<ChatMessage>? messages,
          ChatResultState? resultState}) =>
      ChatState(
        request: request ?? this.request,
        messages: messages ?? this.messages,
        resultState: resultState ?? this.resultState,
      );
}
