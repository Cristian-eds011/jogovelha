import 'package:flutter/material.dart';
import 'package:jogovelha/src/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}

