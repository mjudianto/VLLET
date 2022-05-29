import 'package:flutter/material.dart';
import 'package:vllet/controllers/db_helper.dart';
import './home.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final myController = TextEditingController();
  DbHelper dbHelper = DbHelper();

  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vllet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "How Should We Call You?",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TextFormField(
                              controller: myController,
                              decoration: const InputDecoration(
                                  border: null,
                                  hintText: 'Your Name',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                  )),
                              onChanged: (val) {
                                name = val;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: SizedBox(
                            height: 50,
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () async {
                                  if (name.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        action: SnackBarAction(
                                          label: "OK",
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                        ),
                                        backgroundColor: Colors.white,
                                        content: const Text(
                                          "Please Enter a name",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    await dbHelper.addName(name);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Home(name: name,),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Next  -->',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
