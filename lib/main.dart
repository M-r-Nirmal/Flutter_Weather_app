import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loading_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0x222E335A)),
        scaffoldBackgroundColor: Color.fromARGB(255, 113, 152, 234),
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
