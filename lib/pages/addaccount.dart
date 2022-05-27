import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAccount extends StatelessWidget {
  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  String? newValue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("VLLET"),
            ],
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
                "Add \nAccount",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: DropdownButton(
                  hint: Text("Account Group"),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  isExpanded: true,
                  items: items.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
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
                      Icons.person,
                      color: Color.fromARGB(255, 149, 216, 233),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
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
                        fontWeight: FontWeight.w700,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
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
                        MaterialPageRoute(builder: (context) => AddAccount()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      "S A V E",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
