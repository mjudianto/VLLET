import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vllet/controllers/db_helper.dart';
import 'package:vllet/pages/addtransaction.dart';
import 'package:vllet/pages/models/transaction.dart';
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
  Map? data;
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  DateTime today = DateTime.now();
  DateTime now = DateTime.now();
  int index = 1;

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  void initState() {
    getPreference();
    super.initState();
    box = Hive.box('money');
  }

  getPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<List<TransactionModel>> fetch() async {
    if (box.values.isEmpty) {
      return Future.value([]);
    } else {
      // return Future.value(box.toMap());
      List<TransactionModel> items = [];
      box.toMap().values.forEach((element) {
        // print(element);
        items.add(
          TransactionModel(
            element['tname'],
            element['type'],
            element['amount'] as int,
            element['date'] as DateTime,
            element['note'],
          ),
        );
      });
      return items;
    }
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "CONFIRMATION!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Do you want to edit this transaction?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 101, 246, 106),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      "YES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 211, 84, 84),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    "NO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  getTotalBalance(List<TransactionModel> entireData) {
    totalBalance = 0;
    totalIncome = 0;
    totalExpense = 0;
    for (TransactionModel data in entireData) {
      if (data.date.month == today.month) {
        if (data.type == "Income") {
          totalBalance += data.amount;
          totalIncome += data.amount;
        } else {
          totalBalance -= data.amount;
          totalExpense += data.amount;
        }
      }
    }
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
        body: FutureBuilder<List<TransactionModel>>(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                getTotalBalance(snapshot.data!);
                return ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Welcome \n${widget.name}!",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                              Text(
                                "Rp. $totalBalance",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Income",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.arrow_circle_up_rounded,
                                                  color: Colors.green,
                                                ),
                                                Text(
                                                    "Rp. ${totalIncome.toString()}"),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .arrow_circle_down_rounded,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                    "Rp. ${totalExpense.toString()}"),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
                      child: Text("Recent Transactions",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length + 1,
                      itemBuilder: (context, index) {
                        TransactionModel dataAtIndex;
                        try {
                          // dataAtIndex = snapshot.data![index];
                          dataAtIndex = snapshot.data![index];
                        } catch (e) {
                          // deleteAt deletes that key and value,
                          // hence makign it null here., as we still build on the length.
                          return Container();
                        }

                        if (dataAtIndex.date.month == today.month) {
                          if (dataAtIndex.type == "Income") {
                            return incomeTile(
                              dataAtIndex.amount,
                              dataAtIndex.note,
                              dataAtIndex.date,
                              index,
                            );
                          } else {
                            return expenseTile(
                              dataAtIndex.amount,
                              dataAtIndex.note,
                              dataAtIndex.date,
                              index,
                            );
                          }
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddTransaction(name: (widget.name))),
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
                );
              } else {
                return const Text(
                  "Loading...",
                );
              }
            }));
  }

  Widget expenseTile(int value, String note, DateTime date, int index) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () async {
        await showInformationDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 135, 135),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_down_outlined,
                          size: 28.0,
                          color: Colors.red[700],
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        const Text(
                          "Expense",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),

                    //
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "${date.day} ${months[date.month - 1]} ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "- $value",
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        note,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget incomeTile(int value, String note, DateTime date, int index) {
    return InkWell(
      splashColor: const Color.fromARGB(255, 138, 231, 141),
      onTap: () async {
        await showInformationDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 184, 236, 126),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_circle_up_outlined,
                      size: 28.0,
                      color: Colors.green[700],
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
                      "Income",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "${date.day} ${months[date.month - 1]} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                //
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "+ $value",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //
                //
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    note,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
