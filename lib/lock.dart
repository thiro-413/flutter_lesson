import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';

// ignore: must_be_immutable
class Lock extends StatelessWidget {
  const Lock({super.key});

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
        height: double.maxFinite,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background/background.jpg'),
          fit: BoxFit.cover,
        )),
        child: SizedBox(
          height: screenHeight * 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenHeight,
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          "5月3日 水曜日",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RaleWay',
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "18:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RaleWay',
                            fontSize: 90,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight,
                  // width: double.maxFinite,
                  child: PasscodeScreen(
                    title: const Text(
                      "Enter Password",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    passwordEnteredCallback: (text) {
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Home(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                }));
                      });
                    },
                    cancelButton: const Text('Cancel'),
                    deleteButton: const Text('Delete'),
                    shouldTriggerVerification: const Stream.empty(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
