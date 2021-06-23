import 'package:flutter/material.dart';
import 'package:tabbar_experiment/page2.dart';
import 'package:tabbar_experiment/profile.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final Function handleTap;
  Home({this.handleTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Screen1"),
          TextButton(onPressed: handleTap, child: Text("Screen 2"))
        ],
      ),
    );
  }
}
