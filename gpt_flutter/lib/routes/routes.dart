import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/chat/presentation/chat_page.dart';
import '../main.dart';

GoRouter provideRoutes() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: 'Test');
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'chat',
            builder: (BuildContext context, GoRouterState state) {
              return const ChatWidget();
            },
          ),
        ],
      ),
    ],
  );
}
