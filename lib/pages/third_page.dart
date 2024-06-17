import 'package:flutter/material.dart';
import 'package:oracle_project/core/service/service.dart';
import 'package:oracle_project/pages/pokemon_detail_page.dart';

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
    await service.getPokemons();
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
                        (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PokemonDetailPage(
                                          pokemonName: service.pokemonData
                                              .results![index].name!),
                                    ));
                              },
                              child: Card(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'name : ${service.pokemonData.results![index].name}'),
                                      Text(
                                          'url : ${service.pokemonData.results![index].url}')
                                    ],
                                  ),
                                ),
                              ),
                            ))),
              ));
  }
}
