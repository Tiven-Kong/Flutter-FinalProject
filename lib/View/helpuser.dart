import 'package:flutter/material.dart';

class Helpuser extends StatelessWidget {
  const Helpuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body:Column(
        children: [
          Text("Helo")
        ],
      ) ,
    );
  }
}
