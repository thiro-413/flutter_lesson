import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

import 'lock.dart';

class Open extends StatefulWidget {
  const Open({super.key});

  @override
  State<Open> createState() => _OpenScreen();
}

class _OpenScreen extends State<Open> {
  bool heart = false;

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
        decoration: const BoxDecoration(color: Colors.black),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            setState(() {
              (heart)
                  ? Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Lock(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          }))
                  : heart = true;
            });
          },
          child: (heart)
              // ignore: dead_code
              ? const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 120,
                ).animate().scaleXY(
                    duration: const Duration(seconds: 1),
                  )
              : const SizedBox(),
        ),
      ),
    );
  }
}
