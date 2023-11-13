import 'package:flutter/material.dart';
import 'package:flutter_app/ikestagram.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'ikestagram.dart';

class StoryMoview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 40,
      //   title: Text('池stagram'),
      //   elevation: 0,
      // ),
      body: Container(
        height: screenHeight,
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(color: Colors.black),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(10),
              backgroundColor: Colors.black,
              padding: const EdgeInsets.all(0)),
          child: Image.asset(
            // ignore: prefer_interpolation_to_compose_strings
            "images/story/kamechans.jpeg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
