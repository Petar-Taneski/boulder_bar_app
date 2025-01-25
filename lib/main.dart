import 'package:boulder_bar_app/screens/home.dart';
import 'package:flutter/material.dart';

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
        // define the theme as black
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
