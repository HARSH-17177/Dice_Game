
import 'package:flutter/material.dart';
import 'package:rollingdice/die.dart';
import 'package:rollingdice/homescreen.dart';
// import 'package:rollingdice/splash.dart';




void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Die(),
    );
  }
}
