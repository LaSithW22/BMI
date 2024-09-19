// ignore: unused_import
import 'dart:ffi';

import 'package:bmicalculator/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  late double bmi = calculateBMI(height: 150, weight: 50);

  String gender = '';

  int bmiValue = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 230, 238, 240),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");

                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                          color: gender == 'M'
                              ? Color.fromARGB(255, 7, 71, 182)
                              : Color.fromARGB(255, 118, 163, 240),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male, size: 150),
                          Text("Male",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("female");

                      setState(() {
                        gender = 'f';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                          color: gender == 'f'
                              ? Color.fromARGB(255, 211, 43, 209)
                              : Color.fromARGB(255, 118, 163, 240),
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                          Text("Female",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Color.fromARGB(255, 139, 224, 12)),
                      ),
                      Text(
                        "$height",
                        style: kInputLabelcolor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) height--;
                                /*bmi = calculatebmi(
                                    height: height, weight: weight);*/
                              });

                              print("height");
                            },
                            child: Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 200) height++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                              print(height);
                            },
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              backgroundColor:
                                  Color.fromARGB(255, 143, 75, 203))),
                      Text(
                        "$weight",
                        style: kInputLabelcolor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 30) weight--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                              print(weight);
                            },
                            child: Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 200) weight++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                              print(weight);
                            },
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 50,
              ),
              Column(children: [
                Text("BMI",
                    style: kInputLabelcolor.copyWith(
                      color: Color.fromARGB(255, 146, 4, 68),
                      fontSize: 60,
                    )),
                Text(
                  "${bmi.toStringAsFixed(2)}",
                  style: kInputLabelcolor.copyWith(
                      color: Color.fromARGB(255, 187, 28, 42)),
                ),
                Text(
                  getResult(bmi),
                  style: TextStyle(
                      fontSize: 28,
                      color: const Color.fromARGB(255, 16, 10, 34),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required height, required weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmi) {
    if (bmi >= 25) {
      return 'AHHHH Hodatama Wadie';
    } else if (bmi > 18.5) {
      return "Elakiri. Pit thamai AHHH";
    } else {
      return 'Bath Kala Lokuweyan Puthee';
    }
  }
}
