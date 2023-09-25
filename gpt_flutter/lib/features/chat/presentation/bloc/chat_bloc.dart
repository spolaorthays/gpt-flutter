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

    on<UserMessageEvent>(
      _onUserMessageEvent,
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
      final eventMessage = event.request.messages;
      print('thays - all messages - $cachedAllMessages');
      print('thays - eventMessage - $eventMessage');
      //Converter isso pra uma classe de Collection que dentro terá já essa
      //propriedade de tamanho da lista e ao chamar ela já terá todo tratamento,
      //n precisando ficar removendo/adicionando toda hora
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
          request: ChatRequest(
            state.request?.model ?? 'gpt-3.5-turbo-16k-0613',
            state.messages,
          ),
          messages: cachedAllMessages,
          resultState: ChatResultState.success,
        ),
      );
    } catch (_) {
      emit(state.copyWith(resultState: ChatResultState.error));
    }
  }

  Future<void> _onUserMessageEvent(
    UserMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    cachedAllMessages.add(event.message);
    try {
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
