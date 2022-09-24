import 'package:flutter/material.dart';

void main() {
  runApp(
   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: const Color(0xFF4275f5),
        appBar: AppBar(
          title: const Text("Dice App"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset('images/dice2.jfif'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.asset('images/dice1.jfif'),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
