import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = TextStyle(
      color: Color(0xFF5B777B), fontSize: 24, fontWeight: FontWeight.bold);

  double bill = 0;
  double tip = 0;
  int person = 1;

  // Prepare the result
  double tipPerPerson = 0;
  double totalPerPerson = 0;

  // Create the controller to get the value from input
  TextEditingController _billController = TextEditingController();
  TextEditingController _tipController = TextEditingController();
  TextEditingController _personController = TextEditingController();

  // Create a function to calculate the tip
  void calculate() {
    tipPerPerson = bill * tip / person;
    totalPerPerson = bill * (1 + tip) / person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5E4E7),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PROPINAS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFF5B777B),
                          letterSpacing: 4),
                    ),
                    Text(
                      'APP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFF5B777B),
                          letterSpacing: 4),
                    ),
                  ],
                ),
              ),
            ),
            // Body
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total a pagar',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _billController,
                    onEditingComplete: () {
                      setState(() {
                        if (_billController.text.isNotEmpty) {
                          bill = double.parse(_billController.text);
                        } else {
                          bill = 0;
                        }
                        FocusScope.of(context).unfocus();
                        calculate();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "p. ej.: 100",
                        prefixIcon: Icon(Icons.attach_money_rounded)),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Propina %',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              tip = .05;
                              _tipController.text = '';
                            });
                          },
                          height: 60,
                          color: Color(0xFF00474B),
                          child: Text(
                            '5%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              tip = .1;
                              _tipController.text = '';
                            });
                          },
                          height: 60,
                          color: Color(0xFF00474B),
                          child: Text(
                            '10%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              tip = .15;
                              _tipController.text = '';
                            });
                          },
                          height: 60,
                          color: Color(0xFF00474B),
                          child: Text(
                            '15%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              tip = .25;
                              _tipController.text = '';
                            });
                          },
                          height: 60,
                          color: Color(0xFF00474B),
                          child: Text(
                            '25%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              tip = .5;
                              _tipController.text = '';
                            });
                          },
                          height: 60,
                          color: Color(0xFF00474B),
                          child: Text(
                            '50%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                            controller: _tipController,
                            onEditingComplete: () {
                              setState(() {
                                if (_tipController.text.isNotEmpty) {
                                  tip = double.parse(_tipController.text) / 100;
                                } else {
                                  tip = 0;
                                }
                                FocusScope.of(context).unfocus();
                                calculate();
                              });
                            },
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF3F8FB),
                                border: InputBorder.none,
                                hintText: "Manual",
                                suffixText: '%'),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00474B))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Número de personas',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _personController,
                    onEditingComplete: () {
                      setState(() {
                        if (_personController.text.isNotEmpty) {
                          person = int.parse(_personController.text);
                        } else {
                          person = 1;
                        }
                        FocusScope.of(context).unfocus();
                        calculate();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "p. ej.: 5",
                        prefixIcon: Icon(Icons.person)),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF00474B),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Propina',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '/ persona',
                                  style: TextStyle(
                                      color: Color(0xFF598689), fontSize: 20),
                                )
                              ],
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                '\$${tipPerPerson.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Color(0xFF29C0AD),
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '/ persona',
                                  style: TextStyle(
                                      color: Color(0xFF598689), fontSize: 20),
                                )
                              ],
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                '\$${totalPerPerson.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Color(0xFF29C0AD),
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                              height: 60,
                              color: Color(0xFF26C2AD),
                              onPressed: () {
                                setState(() {
                                  tip = 0;
                                  person = 1;
                                  bill = 0;
                                  calculate();
                                  _tipController.clear();
                                  _billController.clear();
                                  _personController.clear();
                                });
                              },
                              child: Text(
                                'LIMPIAR',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF00494B),
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
