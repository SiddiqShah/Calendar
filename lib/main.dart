import 'dart:math';

import 'package:flutter/material.dart';
import 'history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HistoryScreen(),
    );
  }
}
class RotateExample extends StatelessWidget {
  const RotateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Transform.rotate(
            angle: pi / 6, // Rotate 30 degrees
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
        ),
      ),
      )
    );
  }
}

class ScaleExample extends StatelessWidget {
  const ScaleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Transform.scale(
            scale: 1.8, // Scale to 180%
            child: Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("images/f.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
  }

class TranslateExample extends StatelessWidget {
  const TranslateExample({super.key});
// 📦 Button apni jagah se neeche aur right side chala jayega.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Transform.translate(
            offset: Offset(50, -100), // Move right by 50 and down by 100
            child: ElevatedButton(onPressed: () {}, child: Text("Move Button")),
          ),
        ),
      ),
    );
  }
  }

class SkewExample extends StatelessWidget {
  const SkewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Combine skewX and skewY by multiplying matrices
    final Matrix4 skewMatrix =
        Matrix4.skewX(0.3)..multiply(Matrix4.skewY(0.1));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Skew Example (fixed)')),
        body: Center(
          child: Transform(
            transform: skewMatrix,
            alignment: Alignment.center,
            child: Container(
              width: 240,
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Text(
                'Tilted Card\n(skewX 0.3, skewY 0.1)',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}