import 'package:flutter/material.dart';
import 'package:vllet/controllers/db_helper.dart';
import 'dart:async';

import 'package:vllet/pages/register.dart';

import 'home.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    getName();
  }

  Future getName() async {
<<<<<<< HEAD
    String? name = await dbHelper.getName();
    print(name);

    // if (name != null) {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => Home(name: name),
    //   ));
    // } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Register(),
        ),
      );
    // }
=======
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Register(),
      ),
    );
    //}
>>>>>>> 8509aac74689718bc7db472dd8cb11e3b4fd6188
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {});

    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background1.png"),
                fit: BoxFit.cover),
          ),
          child: const Center(
            child: Text(
              'VLLET',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
