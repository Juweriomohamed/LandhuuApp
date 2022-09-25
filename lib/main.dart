import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int diceOne = 1;
  int diceTwo = 1;
  int playerOneCount = 0;
  int playertwoCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        title: const Text("Dice App"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "😎 To winn get six dice three times🎊",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Player One",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(
                              () {
                                int random = Random().nextInt(6) + 1;
                                diceOne = random;
                                if (diceOne == 6) {
                                  playerOneCount += 1;
                                } else {
                                  playerOneCount = playerOneCount;
                                }
                                if (playerOneCount == 3) {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        title: const Text("Winner Alert"),
                                        content: const Text(
                                            "Player One winned!!🎉🌹"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                  playertwoCount = 0;
                                                  diceTwo = 1;
                                                  playerOneCount = 0;
                                                  diceOne = 1;
                                                });
                                              },
                                              child: const Text("Ok,Lets go."))
                                        ],
                                      );
                                    }),
                                  );
                                }
                              },
                            );
                          },
                          child: Image.asset('images/dice$diceOne.jfif'),
                        ),
                        Text(
                          "Six Dice Counter  $playerOneCount",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Player Two",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            int random = Random().nextInt(6) + 1;
                            diceTwo = random;
                            if (diceTwo == 6) {
                              playertwoCount += 1;
                            } else {
                              playertwoCount = playertwoCount;
                            }
                            if (playertwoCount == 3) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    title: const Text("Winner Alert"),
                                    content:
                                        const Text("Player Two winned!!🎉🌹"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              playertwoCount = 0;
                                              diceTwo = 1;
                                              playerOneCount = 0;
                                              diceOne = 1;
                                            });
                                          },
                                          child: const Text("Ok,Lets go."))
                                    ],
                                  );
                                }),
                              );
                            }
                            setState(() {});
                          },
                          child: Image.asset('images/dice$diceTwo.jfif'),
                        ),
                        Text(
                          "Six Dice Counter  $playertwoCount",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
