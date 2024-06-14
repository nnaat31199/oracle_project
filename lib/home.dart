import 'package:flutter/material.dart';
import 'package:oracle_project/core/provider/navigator_provider.dart';
import 'package:oracle_project/pages/first_page.dart';
import 'package:oracle_project/pages/forth_page.dart';
import 'package:oracle_project/pages/second_page.dart';
import 'package:oracle_project/pages/third_page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
    const ForthPage()
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          navigationProvider.currentIndex = value;
        },
        currentIndex: navigationProvider.currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'first',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'second',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'third',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'forth',
              backgroundColor: Colors.blue),
        ],
      ),
      body: pages[navigationProvider.currentPage],
    );
  }
}
