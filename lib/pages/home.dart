import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vllet/controllers/db_helper.dart';
import 'package:vllet/pages/addtransaction.dart';
import 'package:vllet/pages/setting.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box box;
  DbHelper dbHelper = DbHelper();
  SharedPreferences? prefs;
  @override
  void initState() {
    getPreference();
    super.initState();
    box = Hive.box('money');
  }

  getPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

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
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Welcome \n${widget.name}!",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
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
            ),
            Card(
                elevation: 2.0,
                color: const Color(0xfffff8dd),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Income",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.arrow_circle_up_rounded,
                                          color: Colors.green,
                                        ),
                                        Text("Rp.100000"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Expense",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.arrow_circle_down_rounded,
                                          color: Colors.red,
                                        ),
                                        Text("Rp.100000"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Card(
                elevation: 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Transanction",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("22 April 2022"),
                  ],
                ),
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
