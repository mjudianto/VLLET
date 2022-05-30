import 'package:flutter/material.dart';
import 'package:vllet/controllers/cash_db.dart';
import './pages/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  await Hive.openBox('cash');
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
