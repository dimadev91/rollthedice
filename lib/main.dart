import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 4.0,
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              'Rolly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'Bold',
              ),
            ),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          final overlayState = Overlay.of(context);
          final overlayEntry = OverlayEntry(
            builder: (context) => Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'You rolled a total of ${leftDiceNumber + rightDiceNumber}!',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
          overlayState.insert(overlayEntry);
          Future.delayed(const Duration(seconds: 4), () {
            overlayEntry.remove();
          });
          setState(() {
            leftDiceNumber = Random().nextInt(6) + 1;
            rightDiceNumber = Random().nextInt(6) + 1;
          });
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
