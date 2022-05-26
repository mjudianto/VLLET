import 'package:flutter/material.dart';


class AddAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("VLLET")
            ],
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0.5,
        )
      )
    );
  }
}