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
  List<ChatMessage> cachedAllMessages = [];

  Future<void> _onChatRequestEvent(
    ChatRequestEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(resultState: ChatResultState.loading));

    try {
      final userMessage = event.request.messages.first;
      cachedAllMessages.add(userMessage);
      print('thays - all messages - $cachedAllMessages');
      if (cachedAllMessages.isNotEmpty && cachedAllMessages.length == 20) {
        cachedAllMessages.removeAt(0);
      }
      final request = ChatRequest(event.request.model, cachedAllMessages);

      final response = await _interactor.getChatConversation(request);
      cachedAllMessages
          .add(response.choices?.elementAt(0).message as ChatMessage);
      print('thays - cachedAllMessages: $cachedAllMessages');

      emit(
        state.copyWith(
          messages: cachedAllMessages,
          resultState: ChatResultState.success,
        ),
      );
    } catch (_) {
      emit(state.copyWith(resultState: ChatResultState.error));
    }
  }
}
