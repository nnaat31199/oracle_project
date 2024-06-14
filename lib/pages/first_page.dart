import 'package:flutter/material.dart';
import 'package:oracle_project/core/widget/widget_bucket.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool active = false;
  int? selectCard;
  List<String> name = [
    '1',
    '2',
    '3',
    '4',
  ];
  List<Color> color = [Colors.amber, Colors.red, Colors.green, Colors.blue];
  List<IconData> icon = [
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];
  // List<String> img = ['banner1.png', 'banner2.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Text(
          'HerHob',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                active = !active;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: active != true ? Colors.grey : Colors.amber,
                  borderRadius: BorderRadius.circular(120)),
              child: const Row(
                children: [
                  Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    'sign up/log in',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectCard = null;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: bgColor(index),
                          child: SizedBox(
                            height: 64,
                            width: 64,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icon[index],
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(name[index])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                ),
              ),
              selectCard != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      alignment: Alignment.center,
                      child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: CardShow().cardTest(selectCard.toString())))
                  : Container(),
              Expanded(
                child: GridView.count(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 3 / 4,
                  children: List.generate(20, (index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            selectCard = index + 1;
                          });
                        },
                        child: cardShow.cardTest((index + 1).toString()));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color bgColor(int index) {
    int result = (index + 1) % 4;
    switch (result) {
      case 1:
        return color[0];
      case 2:
        return color[1];
      case 3:
        return color[2];
      case 0:
        return color[3];
      default:
        return Colors.black;
    }
  }
}
