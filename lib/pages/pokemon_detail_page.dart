import 'package:flutter/material.dart';
import 'package:oracle_project/core/service/service.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokemonName;
  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  bool isBool = true;

  @override
  void initState() {
    getPokemonDetail();
    super.initState();
  }

  Future getPokemonDetail() async {
    await service.getPokemonDetail(widget.pokemonName);
    setState(() {
      isBool = false;
    });
  }

  @override
  void dispose() {
    service.pokemonDetail = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(widget.pokemonName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: service.pokemonDetail != null
              ? Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('name : ${service.pokemonDetail!.name}'),
                        Text('weight : ${service.pokemonDetail!.weight}')
                      ],
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
