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
          style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Color.fromARGB(255, 155, 155, 26),
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
                    color: Color.fromARGB(255, 251, 201, 226),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  child: Icon(
                    Icons.date_range,
                    color: Color.fromARGB(255, 178, 66, 66),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "DATE",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
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
                    color: Color.fromARGB(255, 190, 235, 246),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  child: Icon(
                    Icons.event_note,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Note on Transaction",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
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
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    "CREATE TRANSACTION",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
