import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
                    final ChatService service = ChatServiceImpl(GetIt.I.get());
                    service.getListModel();
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
