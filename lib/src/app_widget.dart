import 'package:flutter/material.dart';
import 'package:jogovelha/src/home/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(207, 13, 25, 90),
          onPrimary: Color.fromARGB(255, 84, 89, 156),
          secondary: Color.fromARGB(255, 140, 156, 228),
          onSecondary: Color.fromARGB(31, 107, 192, 195),
          error: Color.fromARGB(31, 26, 22, 41),
          onError: Color.fromARGB(31, 40, 40, 161),
          background: Color.fromARGB(103, 149, 120, 120),
          onBackground: Color.fromARGB(31, 255, 255, 255),
          surface: Color.fromARGB(224, 44, 55, 200),
          onSurface: Color.fromARGB(31, 144, 127, 219),
        ),
      ),
      home: Home(),
    );
  }
}
