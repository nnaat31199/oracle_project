import 'package:flutter/material.dart';

CardShow cardShow = CardShow();

class CardShow {
  Widget cardTest(String label) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        child: Center(
          child: Text(label),
        ));
  }
}

Widget test() {
  return Container();
}

int testnum() {
  return 0;
}