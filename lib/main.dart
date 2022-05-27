import 'package:flutter/material.dart';
import './pages/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vllet',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white, fontFamily: 'Montserrat'),
        home: Welcome());
  }
}
