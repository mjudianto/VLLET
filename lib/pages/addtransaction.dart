import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vllet/controllers/db_helper.dart';
import 'package:vllet/pages/home.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key? key, required this.name}) : super(key: key);
  String name;
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  var items = ['Cash', 'Accounts', 'Cards'];
  String accountgroup1 = "From";
  String accountgroup2 = "To";
  DateTime selectedDate = DateTime.now();
  int? amount;
  String note = "";
  String tname = "";
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String choice = '';
  bool transfer = false;
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
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
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Transaction Name",
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (val) {
                  tname = val;
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 225, 238),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    child: const Icon(
                      Icons.money_rounded,
                      size: 30.0,
                      color: Color.fromARGB(255, 141, 63, 184),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ChoiceChip(
                    label: const Text(
                      "Income",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    selectedColor: const Color.fromARGB(255, 141, 63, 184),
                    selected: (choice == 'Income') ? true : false,
                    onSelected: (bool value) {
                      setState(() {
                        choice = 'Income';
                        transfer = false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ChoiceChip(
                    label: const Text(
                      "Expense",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    selectedColor: const Color.fromARGB(255, 141, 63, 184),
                    selected: (choice == 'Expense') ? true : false,
                    onSelected: (bool value) {
                      setState(() {
                        choice = 'Expense';
                        transfer = false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ChoiceChip(
                    label: const Text(
                      "Transfer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    selectedColor: const Color.fromARGB(255, 141, 63, 184),
                    selected: (choice == 'Transfer') ? true : false,
                    onSelected: (bool value) {
                      setState(() {
                        choice = 'Transfer';
                        transfer = true;
                      });
                    },
                  ),
                ],
              ),
                  (transfer)
                      ? Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: Text(accountgroup1),
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 200, 200, 200)),
                    items: items.map((String items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      accountgroup1 = value.toString();
                    },
                    ),
                    Icon(Icons.arrow_left_outlined, color: Colors.black),
                    Icon(Icons.arrow_right_outlined, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text(accountgroup2),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Color.fromARGB(255, 200, 200, 200)),
                        items: items.map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          accountgroup2 = value.toString();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                height: 15.0,
                ),
              ],
              )
              : Text(""),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 225, 238),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: const Text(
                      "RP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 155, 155, 26),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "0",
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      onChanged: (val) {
                        try {
                          amount = int.parse(val);
                        } catch (e) {
                          // show Error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              duration: const Duration(
                                seconds: 2,
                              ),
                              content: Row(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "Enter only Numbers as Amount",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 201, 226),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: const Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 178, 66, 66),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextButton(
                      onPressed: () {
                        _selectDate(context);
                        //
                        // to make sure that no keyboard is shown after selecting Date
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.zero,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${selectedDate.day} ${months[selectedDate.month - 1]} ${selectedDate.year}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 190, 235, 246),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: const Icon(
                      Icons.event_note,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Note on Transaction",
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      onChanged: (val) {
                        note = val;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (amount != null) {
                        DbHelper dbHelper = DbHelper();
                        dbHelper.addData(
                            tname, choice, amount!, selectedDate, note);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Home(name: (widget.name)),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red[700],
                            content: const Text(
                              "Please enter a valid amount!",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(357, 63),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      "CREATE TRANSACTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
