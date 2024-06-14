import 'package:dio/dio.dart';
import 'package:oracle_project/core/models/pokemon_model.dart';

final dio = Dio();

Service service = Service();

class Service {
  PokemonData pokemonData = PokemonData();

  Future getPokemon() async {
    Response response = await dio.get('https://pokeapi.co/api/v2/pokemon');
    // print(response.data['results']);

    pokemonData = PokemonData.fromJson(response.data);
  }
}
