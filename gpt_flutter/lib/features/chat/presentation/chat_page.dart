import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gpt_flutter/features/chat/data/model/chat_model.dart';
import 'package:gpt_flutter/features/chat/data/service/chat_service.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'New chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      /*borderSide: BorderSide(
                      color: Colors.white30,
                    ),*/
                      ),
                  hintText: 'Init chat with chat GPT',
                  hintStyle: TextStyle(
                    color: Colors.white30,
                  ),
                  suffixIcon: Icon(
                    Icons.send,
                    color: Color(0xFF6750A4),
                  ), //Image.asset('assets/images/icon_send.png'),
                  //suffixIconColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () => print('click in button'),
                child: IconButton(
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
                  icon: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
