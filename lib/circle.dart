import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      )
    );
  }
}

class MyRoundedSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container (
        height: 300,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromRGBO(220, 220, 220, 100),
          borderRadius: BorderRadius.circular(15.0),
        ),            padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20),
        child: const Center(
        child: Text("This should be another project"),
        ),
      ),
    );
  }
}
