import 'package:flutter/material.dart';

import 'border-animation-round.dart';
import 'rive-animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const WitcherAnimationRive(),
      home: const BorderAnimationRound(),
    );
  }
}