import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_event.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_states.dart';
import 'package:gpt_flutter/features/chat/presentation/widget/chat_success_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => GetIt.I.get<ChatBloc>(),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          switch (state.resultState) {
            //TODO criar um widget pra cada estado
            case ChatResultState.loading:
            //return const ChatSuccessWidget();
            case ChatResultState.success:
              return ChatSuccessWidget(
                messages: state.messages,
              );
            case ChatResultState.empty:
              return ChatSuccessWidget(
                messages: state.messages,
              );
            case ChatResultState.error:
              return ChatSuccessWidget(
                messages: state.messages,
              );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
