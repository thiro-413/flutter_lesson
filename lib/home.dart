import 'package:flutter/material.dart';
import 'package:flutter_app/ikestagram.dart';
import 'package:passcode_screen/passcode_screen.dart';

class Home extends StatelessWidget {
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
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/home/home_1.jpeg'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
