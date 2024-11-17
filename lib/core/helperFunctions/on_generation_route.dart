import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case RegisterPage.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case SettingsPage.routeName:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    case ChatPage.routeName:
  final arguments = settings.arguments as Map<String, dynamic>;
  return MaterialPageRoute(
    builder: (context) => ChatPage(
      chatId: arguments['chatId'],
      userId: arguments['userId'],
      userName: arguments['userName'],
      receiverId: arguments['receiverId'], // تمرير receiverId
    ),
  );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
