import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test147/Result.dart';
import 'dart:math';

class firstFrm extends StatefulWidget {
  const firstFrm({super.key});

  @override
  State<firstFrm> createState() => _firstFrmState();
}

class _firstFrmState extends State<firstFrm> {
  @override
  TextEditingController midterm1 = TextEditingController();
  TextEditingController term1 = TextEditingController();
  TextEditingController midterm2 = TextEditingController();
  TextEditingController term2 = TextEditingController();
  double ScoreAll = 0.00;
  String Grade = "";
  double totalScore() {
    ScoreAll = double.parse(midterm1.text.toString()) +
        double.parse(term1.text.toString()) +
        double.parse(midterm2.text.toString()) +
        double.parse(term2.text.toString());
    return ScoreAll;
  }

  String grade() {
    if (ScoreAll >= 80) {
      Grade = 'A';
    } else if (ScoreAll >= 70) {
      Grade = 'B';
    } else if (ScoreAll >= 60) {
      Grade = 'C';
    } else if (ScoreAll >= 50) {
      Grade = 'D';
    } else {
      Grade = 'F';
    }
    return Grade;
  }

  Widget AppName() {
    return Container(
      child: Text(
        "คำนวณเกรด",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w500,
          color: Colors.red,
          fontFamily: "RubikGemstones",
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
    );
  }

  Widget input_midterm1() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: midterm1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "คะแนนสอบกลางภาค เทอม 1",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget input_term1() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: term1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "คะแนนสอบปลายภาค เทอม 1",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget input_midterm2() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: midterm2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "คะแนนสอบกลางภาค เทอม 2",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget input_term2() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: term2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "คะแนนสอบปลายภาค เทอม 2",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget Submit_BTN() {
    return Container(
      child: ElevatedButton(
        child: Text("คำนวณ"),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.green,
            shadowColor: Colors.red),
        onPressed: () {
          Map<String, String> passdata = {
            "score": totalScore().toString(),
            "grade": grade(),
          };
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => result(getdata: passdata)));
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.cover),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppName(),
                  input_midterm1(),
                  input_term1(),
                  input_midterm2(),
                  input_term2(),
                  Submit_BTN()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
