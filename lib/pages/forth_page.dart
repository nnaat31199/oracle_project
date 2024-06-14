import 'package:flutter/material.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({super.key});

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(number.toString()),
          Container(
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    number = number + 1;
                  });
                  print(number);
                },
                child: const Text('button'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
