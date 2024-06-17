import 'package:dio/dio.dart';
import 'package:oracle_project/core/models/pokemon_model.dart';
import 'package:oracle_project/core/models/pokemon_detail_model.dart';

final dio = Dio();

Service service = Service();

class Service {
  PokemonData pokemonData = PokemonData();
  PokemonDetail? pokemonDetail;

  Future getPokemons() async {
    Response response = await dio.get('https://pokeapi.co/api/v2/pokemon');
    // print(response.data['results']);

    pokemonData = PokemonData.fromJson(response.data);
  }

  Future getPokemonDetail(String pokemonName) async {
    Response response = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonName');
    print(response.data);

    pokemonDetail = PokemonDetail.fromJson(response.data);
  }
}
