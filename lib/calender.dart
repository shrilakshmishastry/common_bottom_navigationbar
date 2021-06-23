import 'package:flutter/material.dart';
import 'package:tabbar_experiment/page2.dart';

class Calender extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final Function onNext;
  Calender({this.onNext});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Calender"),
          TextButton(
              onPressed: onNext,
              child: Text("Screen 2"))
        ],
      ),
    );
  }
}
