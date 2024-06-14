import 'package:flutter/material.dart';
import 'package:oracle_project/core/service/service.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool isLoad = true;

  @override
  void initState() {
    getPokemon();
    super.initState();
  }

  Future getPokemon() async {
    await service.getPokemon();
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoad
            ? const Center(
                child: Text('Loading'),
              )
            : SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        service.pokemonData.results!.length,
                        (index) => Card(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                        'name : ${service.pokemonData.results![index].name}'),
                                    Text(
                                        'url : ${service.pokemonData.results![index].url}')
                                  ],
                                ),
                              ),
                            ))),
              ));
  }
}
