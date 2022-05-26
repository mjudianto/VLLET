import 'package:flutter/material.dart';
import 'package:vllet/pages/addtransaction.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        title: const Text("Vllet"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome Back,\n Thia!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Expanded(
                    child: ElevatedButton(onPressed: null, child: Text("Mar"))),
                Expanded(
                    child:
                        ElevatedButton(onPressed: null, child: Text("April"))),
                Expanded(
                    child: ElevatedButton(onPressed: null, child: Text("May")))
              ],
            ),
            Card(
                elevation: 2.0,
                color: Color(0xfffff8dd),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [Text("Income"), Text("Expense")],
                      )
                    ],
                  ),
                )),
            Card(
              elevation: 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Transanction",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("22 April 2022")
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTransaction()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text("+"),
            )
          ],
        ),
      ),
    );
  }
}
