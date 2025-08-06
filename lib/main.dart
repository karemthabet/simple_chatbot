import 'package:flutter/material.dart';
import 'package:simple_chatbot/welcome_page.dart';

void main() {
  runApp(const BipolarChatBotApp());
}

class BipolarChatBotApp extends StatelessWidget {
  const BipolarChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بوت التعامل مع الاضطراب الوجداني',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.deepPurple,
      ),
      home: const WelcomePage(),
    );
  }
}
