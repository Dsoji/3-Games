import 'package:flutter/material.dart';
import 'package:three_games/games/pickgames_page,.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,
          primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: const PickGamePage(),
    );
  }
}
