//import 'dart:ffi';

import 'package:bmi_calculator/pages/result_screen.dart';
//import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int wieght = 60;
  int age = 20;
  int height = 120;
  bool isMale = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("BMI calculator", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          children: [
            //male w female
            MaleAndFemale(),

            SizedBox(height: 15),

            height_ui(),

            SizedBox(height: 15),

            wieghtAndage(),

            SizedBox(height: 15),

            caculatebutton(),
          ],
        ),
      ),
    );
  }

  SizedBox caculatebutton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () {
          double result=(wieght)/(height * height *0.0001);
          Navigator.push(
            
            (context),
            MaterialPageRoute(builder: (context) => ResultScreen(result: result,)
            ),
          );
        },
        child: Text(
          "calculate",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: appcolor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Expanded wieghtAndage() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: appcolor.cardcolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("wieght", style: TextStyle(color: Colors.white)),
                  Text(
                    wieght.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            wieght++;
                          });
                        },
                        icon: Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            wieght--;
                          });
                        },
                        icon: Icon(Icons.remove),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: appcolor.cardcolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("age", style: TextStyle(color: Colors.white)),
                  Text(
                    age.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        icon: Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        icon: Icon(Icons.remove),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded height_ui() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: appcolor.cardcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hight", style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("cm", style: TextStyle(color: Colors.white)),
              ],
            ),
            Slider(
              value: height.toDouble(),
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
              min: 70,
              max: 270,
              activeColor: appcolor.primaryColor,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Expanded MaleAndFemale() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: (isMale) ? appcolor.primaryColor : appcolor.cardcolor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male, size: 100, color: Colors.white),
                    Text("Male", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 15),

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: !isMale ? appcolor.primaryColor : appcolor.cardcolor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.female, color: Colors.white, size: 100),
                    Text("Female", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
