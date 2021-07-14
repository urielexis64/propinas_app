import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5E4E7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 300,
              child: Center(
                child: SvgPicture.asset('assets/logo.svg'),
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
                    'Bills',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "eg: 100",
                        prefixIcon: Icon(Icons.attach_money_rounded)),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Select Tip %',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF3F8FB),
                                border: InputBorder.none,
                                hintText: "Custom",
                                prefixIcon: Icon(Icons.attach_money_rounded)),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00474B))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Number of people',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "eg: 5",
                        prefixIcon: Icon(Icons.person)),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 32,
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
                                  'Tip Amount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '/ Person',
                                  style: TextStyle(
                                      color: Color(0xFF598689), fontSize: 20),
                                )
                              ],
                            ),
                            Text(
                              '\$4.27',
                              style: TextStyle(
                                  color: Color(0xFF29C0AD),
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
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
                                  '/ Person',
                                  style: TextStyle(
                                      color: Color(0xFF598689), fontSize: 20),
                                )
                              ],
                            ),
                            Text(
                              '\$4.27',
                              style: TextStyle(
                                  color: Color(0xFF29C0AD),
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
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
                              onPressed: () {},
                              child: Text(
                                'RESET',
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
