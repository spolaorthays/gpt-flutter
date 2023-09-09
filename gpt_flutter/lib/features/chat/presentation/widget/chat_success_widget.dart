import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_flutter/commons/components/widgets/card_text_widget.dart';
import 'package:gpt_flutter/features/chat/presentation/bloc/chat_bloc.dart';

import '../../../../commons/components/model/card_margin_model.dart';
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final message = widget.messages[index];
                print('Thays - Valor da message $message');
                if (message.role == 'user') {
                  return LayoutBuilder(
                    builder: (context, constrainsts) {
                      return SizedBox(
                        width: constrainsts.maxWidth * 0.7,
                        child: CardImageTextWidget(
                          marginModel: CardMarginModel(
                              top: 0, left: 20, right: 0, bottom: 32),
                          cardRadius: 20,
                          cardText: message.content ?? '',
                        ),
                      );
                    },
                  );
                } else {
                  return LayoutBuilder(
                    builder: (context, constrainsts) {
                      return SizedBox(
                        width: constrainsts.maxWidth * 0.7,
                        child: CardImageTextWidget(
                          marginModel: CardMarginModel(
                              top: 0, left: 20, right: 0, bottom: 32),
                          cardRadius: 20,
                          cardText: message.content ?? '',
                          shouldShowImage: true,
                        ),
                      );
                    },
                  );
                }
              },
              childCount: widget.messages.length,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            sliver: SliverToBoxAdapter(
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
                      print('Texto digitado: ${controller.text}');
                      chatBloc.add(
                        UserMessageEvent(
                          ChatMessage(
                            'user',
                            controller.text,
                          ),
                        ),
                      );

                      chatBloc.add(
                        ChatRequestEvent(
                          ChatRequest(
                            'gpt-3.5-turbo-16k-0613',
                            [
                              ChatMessage('user', controller.text),
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
          ),
          /*Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /*ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.messages.length,
                itemBuilder: (context, index) {
                  final message = widget.messages[index];
                  if (message.role == 'user') {
                    return LayoutBuilder(
                      builder: (context, constrainsts) {
                        return SizedBox(
                          width: constrainsts.maxWidth * 0.7,
                          child: CardTextWidget(
                            cardColor: const Color(0xFF6750A4),
                            borderRadius: 20,
                            cardText: message.content ?? '',
                          ),
                        );
                      },
                    );
                  } else {
                    return LayoutBuilder(
                      builder: (context, constrainsts) {
                        return SizedBox(
                          width: constrainsts.maxWidth * 0.7,
                          child: CardImageTextWidget(
                            marginModel: CardMarginModel(
                                top: 0, left: 20, right: 0, bottom: 32),
                            cardRadius: 20,
                            cardText: message.content ?? '',
                          ),
                        );
                      },
                    );
                  }
                },
              ),*/
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
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
                        print('Texto digitado: ${controller.text}');
                        chatBloc.add(
                          ChatRequestEvent(
                            ChatRequest(
                              'gpt-3.5-turbo-16k-0613',
                              [
                                ChatMessage('user', controller.text),
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
          ),*/
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
