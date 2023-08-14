import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_flutter/commons/components/widgets/card_text_widget.dart';
import 'package:gpt_flutter/commons/components/widgets/image_text_widget.dart';
import 'package:gpt_flutter/commons/components/model/card_text_model.dart';
import 'package:gpt_flutter/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: provideRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/open_ai_logo.png'),
              ),
              const Text(
                'Welcome to Chat GPT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Ask anything, get yout answer',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const ImageTextWidget(
                imagePath: 'assets/images/open_ai_logo.png',
                imageText: 'Examples',
              ),
              CardTextWidget(
                cardText:
                    'Remembers what user said earlier in the conversation',
                rgboColors: CardTextModel(255, 255, 255, 0.08),
              ),
              ElevatedButton(
                onPressed: () => context.go(
                  '/chat',
                ),
                child: const Text(
                  'Lets go',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
                  onPressed: () {},
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
