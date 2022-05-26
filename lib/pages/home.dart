import 'package:flutter/material.dart';
import 'package:vllet/pages/addtransaction.dart';
import 'package:vllet/pages/setting.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        title: const Text(
          "VLLET",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome, \n" + widget.username + "!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: const [
                Expanded(
                    child: ElevatedButton(
                        onPressed: null,
                        child: Text("Maret",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )))),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: null,
                        child: Text("April",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )))),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: null,
                        child: Text("May",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )))),
                SizedBox(
                  width: 12.0,
                ),
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
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
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
                child: const Text(
                  "+",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
