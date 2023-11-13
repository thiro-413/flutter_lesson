import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

import 'ikestagram.dart';
import 'lock.dart';
import 'open.dart';
import 'white.dart';

final logger = Logger();

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: white),
      home: const MyHomePage(title: '池stagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child:
                  const Text("池stagram", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IkeStagram()));
              },
            ),
            TextButton(
              child: const Text("起動画面", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Open(),
                      fullscreenDialog: true,
                    ));
              },
            ),
            TextButton(
              child: const Text("ロック画面", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lock(),
                      fullscreenDialog: true,
                    ));
              },
            ),
            TextButton(
              child: const Text("ホワイト", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => White(),
                      fullscreenDialog: true,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
