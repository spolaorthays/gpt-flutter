import 'package:flutter/material.dart';
import 'package:gpt_flutter/commons/di/injection.dart';
import 'package:gpt_flutter/features/onboard/presentation/onboard_widget.dart';
import 'package:gpt_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
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
    return const OnboardWidget();
  }
}
