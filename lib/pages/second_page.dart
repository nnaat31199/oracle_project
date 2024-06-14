import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.black,
              child: Row(
                children: [
                  const Expanded(
                      child: Text(
                    'app name',
                    style: TextStyle(color: Colors.white),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.abc, color: Colors.white),
                  const SizedBox(
                    width: 8,
                  ),
                  DropdownButtonHideUnderline(
                      child: DropdownButton2(
                    customButton: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(120)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    items: [
                      ...MenuItems.items.map(
                        (item) => DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    dropdownStyleData: DropdownStyleData(
                      width: 160,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.amber),
                      offset: const Offset(0, 8),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      customHeights: [
                        ...List<double>.filled(MenuItems.items.length, 48)
                      ],
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ))
                ],
              ),
            ),
            // Container(
            //   child: const Row(
            //     children: [Text('test')],
            //   ),
            // ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: const Column(
                  children: [],
                ),
              ),
            )),
            Container()
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> items = [myProfile, request, history, logOut];

  static const myProfile =
      MenuItem(text: 'My Profile', icon: Icons.person_rounded);
  static const request =
      MenuItem(text: 'Request', icon: Icons.file_upload_rounded);
  static const history = MenuItem(text: 'History', icon: Icons.history_rounded);
  static const logOut = MenuItem(text: 'Log out', icon: Icons.logout_rounded);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 24),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
