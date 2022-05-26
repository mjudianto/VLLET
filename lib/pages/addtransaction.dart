import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        title: const Text(
          "VLLET",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
              "Add \nTransaction",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Transaction Name",
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 225, 238),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                  child: Icon(
                    Icons.money_rounded,
                    size: 30.0,
                    color: Color.fromARGB(255, 141, 63, 184),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                ChoiceChip(
                  label: Text(
                    "Income",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  selected: true,
                ),
                SizedBox(
                  width: 15.0,
                ),
                ChoiceChip(
                  label: Text(
                    "Expense",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Color.fromARGB(255, 141, 63, 184),
                  selected: true,
                ),
                SizedBox(
                  width: 15.0,
                ),
                ChoiceChip(
                  backgroundColor: Colors.black,
                  label: Text(
                    "Transfer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  selected: true,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 225, 238),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  child: Text(
                    "RP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "0",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 225, 238),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  child: Icon(
                    Icons.calendar_today,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "0",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            Container(
              height: 30.0,
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
                child: const Text("+",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
