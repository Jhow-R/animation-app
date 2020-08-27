// ignore: unused_import
import 'package:animacao/views/fade_view.dart';
import 'package:animacao/views/flip_view.dart';
// ignore: unused_import
import 'package:animacao/views/pulse_view.dart';
// ignore: unused_import
import 'package:animacao/views/slide_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animações Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlipView(),
      // home: SlideView(),
      //home: PulseView(),
      // home: FadeView(),
    );
  }
}
