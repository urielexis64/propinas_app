import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:propinas_app/widgets/text_input_field.dart';
import 'package:propinas_app/widgets/tip_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = const TextStyle(
      color: Color(0xFF5B777B), fontSize: 24, fontWeight: FontWeight.bold);

  double bill = 0;
  double tip = 0;
  int person = 1;
  int currentIndex = -1;

  // Prepare the result
  double tipPerPerson = 0;
  double totalPerPerson = 0;

  // Create the controller to get the value from input
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();
  final TextEditingController _personController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  // Create a function to calculate the tip
  void calculate() {
    if (_billController.text.isNotEmpty) {
      bill = double.parse(_billController.text);
    } else {
      bill = 0;
    }
    if (_personController.text.isNotEmpty) {
      person = int.parse(_personController.text);
    } else {
      person = 1;
    }
    //FocusScope.of(context).unfocus();
    tipPerPerson = bill * tip / person;
    totalPerPerson = bill * (1 + tip) / person;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC5E4E7),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            // Header
            SizedBox(
              width: double.infinity,
              height: size.height * .3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
              decoration: const BoxDecoration(
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextInputField(
                      controller: _billController,
                      onChanged: (value) => calculate(),
                      prefixIcon: Icons.attach_money_rounded,
                      hintText: "p. ej.: 100"),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Propina %',
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TipButton(
                          active: currentIndex == 0,
                          text: '5%',
                          onPressed: () {
                            setState(() {
                              tip = .05;
                              _tipController.text = '';
                              calculate();
                              currentIndex = 0;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      TipButton(
                          active: currentIndex == 1,
                          text: '10%',
                          onPressed: () {
                            setState(() {
                              tip = .1;
                              _tipController.text = '';
                              calculate();
                              currentIndex = 1;
                            });
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TipButton(
                          active: currentIndex == 2,
                          text: '15%',
                          onPressed: () {
                            setState(() {
                              tip = .15;
                              _tipController.text = '';
                              calculate();
                              currentIndex = 2;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      TipButton(
                          active: currentIndex == 3,
                          text: '25%',
                          onPressed: () {
                            setState(() {
                              tip = .25;
                              _tipController.text = '';
                              calculate();
                              currentIndex = 3;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TipButton(
                          active: currentIndex == 4,
                          text: '50%',
                          onPressed: () {
                            setState(() {
                              tip = .5;
                              _tipController.text = '';
                              calculate();
                              currentIndex = 4;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextInputField(
                            controller: _tipController,
                            onChanged: (value) {
                              if (_tipController.text.isNotEmpty) {
                                tip = double.parse(_tipController.text) / 100;
                                currentIndex = -1;
                              } else {
                                tip = 0;
                              }
                              calculate();
                            },
                            fontSize: 20,
                            suffixText: '%',
                            hintText: "Manual"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Número de personas',
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInputField(
                      controller: _personController,
                      onChanged: (value) => calculate(),
                      prefixIcon: Icons.person,
                      hintText: "p. ej.: 5"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: calculate,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF26C2AD))),
                          child: const Text(
                            'CALCULAR',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFF00474B),
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
                              children: const [
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
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  '\$${tipPerPerson.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      color: Color(0xFF29C0AD),
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
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
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  '\$${totalPerPerson.toStringAsFixed(2)}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color(0xFF29C0AD),
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                              height: 60,
                              color: const Color(0xFF26C2AD),
                              onPressed: () {
                                setState(() {
                                  tip = 0;
                                  person = 1;
                                  bill = 0;
                                  currentIndex = -1;
                                  calculate();
                                  _tipController.clear();
                                  _billController.clear();
                                  _personController.clear();
                                  FocusScope.of(context).unfocus();
                                  animateScroll(0);
                                });
                              },
                              child: const Text(
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

  void animateScroll(double offset) {
    _scrollController.animateTo(offset,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
