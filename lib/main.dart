import 'package:translate_ipssi/pages/translate.dart';
import 'package:translate_ipssi/pages/correction.dart';
import 'package:translate_ipssi/pages/chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translate IPSSI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
      //home: const MyCorrectionPage(),
      //debugShowCheckedModeBanner: false,
    );
  }
}