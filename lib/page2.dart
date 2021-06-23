import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  // const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Screen2"),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back"))
        ],
      ),
    );
  }
}
