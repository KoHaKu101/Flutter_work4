import 'package:flutter/material.dart';
import 'package:test147/FirstFrm.dart';

class result extends StatefulWidget {
  final Map<String, String> getdata;
  const result({super.key, required this.getdata});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget AppName() {
    return Container(
      child: Text(
        "Result",
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

  Widget Score_Result() {
    return Container(
      child: Text(
        "คะแนน = " + widget.getdata["score"].toString(),
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

  Widget Grade_Result() {
    return Container(
      child: Text(
        "เกรด = " + widget.getdata["grade"].toString(),
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

  Widget Back_BTN() {
    return Container(
      child: ElevatedButton(
        child: Text("Back"),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.green,
            shadowColor: Colors.red),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => firstFrm()));
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
                  Score_Result(),
                  Grade_Result(),
                  Back_BTN()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
