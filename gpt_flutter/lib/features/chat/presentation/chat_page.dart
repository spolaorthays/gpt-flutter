import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:gpt_flutter/features/chat/data/service/chat_service.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Init chat with chat GPT',
              hintStyle: const TextStyle(
                color: Colors.white30,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  final ChatService service = GetIt.I.get();
                  //service.getListModel(); //TODO pode pegar daqui o modelo

                  List<ChatMessage> messages = [
                    ChatMessage('system', 'hello my friend'),
                    ChatMessage('user', 'hello my robot')
                  ];
                  final ChatRequest request =
                      ChatRequest('gpt-3.5-turbo-16k-0613', messages);
                  final ChatResponse = service.getChatConversation(request);
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
        ],
      ),
    );
  }
}
