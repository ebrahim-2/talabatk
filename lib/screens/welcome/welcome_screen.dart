import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

part './components/Header.dart';
part './components/LoginButton.dart';
part './components/SignUpButton.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Header(size: size),
          SizedBox(
            height: 70,
          ),
          LoginButton(size: size),
          SizedBox(
            height: 20,
          ),
          SignUpButton(size: size),
        ],
      ),
    );
  }
}
