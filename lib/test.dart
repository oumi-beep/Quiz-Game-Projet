import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 3, 62, 66),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 35, // Use a lower elevation for better appearance
        title: const Text('QuizGame'),titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Define your action here
          },
          icon: const Icon(Icons.menu, size: 33),
        ),
      ),
      body: const Center(
        child: Text('Welcome to QuizGame!'),
      ),
    );
  }
}
