import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_flutter/commons/strings/chat_strings.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_bloc.dart';

import '../../../../commons/components/widgets/card_image_text_widget.dart';
import '../../data/model/chat_model.dart';
import '../bloc/chat_event.dart';

class ChatSuccessWidget extends StatefulWidget {
  const ChatSuccessWidget({
    required this.messages,
    super.key,
  });

  final List<ChatMessage> messages;

  @override
  State<StatefulWidget> createState() => _ChatSuccessWidgetState();
}

class _ChatSuccessWidgetState extends State<ChatSuccessWidget>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ChatBloc chatBloc = context.read<ChatBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFF141218),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141218),
        title: const Text(
          'New chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final message = widget.messages[index];
                      return LayoutBuilder(
                        builder: (context, constrainsts) {
                          return SizedBox(
                            width: constrainsts.maxWidth * 0.7,
                            child: CardImageTextWidget(
                              role: message.role ?? ChatStrings.roleUser,
                              message: message.content ?? '',
                            ),
                          );
                        },
                      );
                    },
                    childCount: widget.messages.length,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Init chat with chat GPT',
                      hintStyle: const TextStyle(
                        color: Colors.white30,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          chatBloc.add(
                            ChatRequestEvent(
                              ChatRequest(
                                'gpt-3.5-turbo-16k-0613',
                                [
                                  ChatMessage(
                                    ChatStrings.roleUser,
                                    controller.text,
                                  ),
                                ],
                              ),
                            ),
                          );
                          controller.clear();
                        },
                        icon: SizedBox(
                          width: 70,
                          height: 70,
                          child: Align(
                            alignment: Alignment.center,
                            child: Card(
                              color: const Color(0xFF6750A4),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/icon_send.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
