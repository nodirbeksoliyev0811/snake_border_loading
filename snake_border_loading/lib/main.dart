import 'package:flutter/material.dart';
import 'package:snake_border_loading/snake_border_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SnakeBorderLoading(
            beginColor: Colors.blue,
            endColor: Colors.green,
            length: 40,
            thickness: Offset(1, 1),
            duration: const Duration(seconds: 3),
            isLoading: true,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
