import 'package:flutter/material.dart';
import 'package:gpt_flutter/widgets/card_text_widget.dart';
import 'package:gpt_flutter/widgets/image_text_widget.dart';
import 'package:gpt_flutter/widgets/model/card_text_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GPT Flutter PDI'),
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
      //backgroundColor: Color.fromARGB(20, 18, 24, 100),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Stack(
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
