import 'package:gpt_flutter/commons/helpers/chat_message_collection.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:gpt_flutter/features/chat/domain/chat_interactor.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_event.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_states.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) =>
    (events, mapper) => droppable<E>().call(events.throttle(duration), mapper);

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._interactor) : super(const ChatState()) {
    on<ChatRequestEvent>(
      _onChatRequestEvent,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  final ChatInteractor _interactor;
  ChatMessageCollection chatMessageCollection = ChatMessageCollection();

  Future<void> _onChatRequestEvent(
    ChatRequestEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(resultState: ChatResultState.loading));

    try {
      final userMessage = event.request.messages.first;
      chatMessageCollection.add(userMessage);
      print('thays - all messages - ${chatMessageCollection.getList()}');

      final request = ChatRequest(
        event.request.model,
        chatMessageCollection.getList(),
      );

      final response = await _interactor.getChatConversation(request);
      chatMessageCollection
          .add(response.choices?.elementAt(0).message as ChatMessage);
      print('thays - cachedAllMessages: ${chatMessageCollection.getList()}');

      emit(
        state.copyWith(
          messages: chatMessageCollection.getList(),
          resultState: ChatResultState.success,
        ),
      );
    } catch (_) {
      emit(state.copyWith(resultState: ChatResultState.error));
    }
  }
}
