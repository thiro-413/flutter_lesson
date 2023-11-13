import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'storyMovie.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  StoryState createState() => StoryState();
}

class StoryState extends State<Story> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  final users = [
    {
      "name": "taiki_furuyama",
      "image": "icon_furuyama.jpeg",
    },
    {
      "name": "JunjiMan",
      "image": "icon_junji.jpeg",
    },
    {
      "name": "otsuka",
      "image": "icon_otsuka.jpeg",
    },
    {
      "name": "mura_2000",
      "image": "icon_murai.jpeg",
    },
    {
      "name": "hiroki_trt",
      "image": "icon_terata.jpeg",
    },
  ];
  final widgetKey = GlobalKey();

  double _currentPositionX = 0;
  double _currentPositionY = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var user in users)
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  IconButton(
                      iconSize: 80,
                      icon: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage("images/topIcon/insta_back.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "images/topIcon/${user["image"]!}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      StoryMoview(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.topLeft,
                                  child: child,
                                );
                              }),
                        );
                      }),
                  Text(user["name"]!),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
