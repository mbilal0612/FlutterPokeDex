import 'dart:convert';

import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  Future<List<Pokemon>> getAllPokemon() async {
    String url =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)["pokemon"];



      final pokemon = json.map((js){
        return Pokemon.fromJson(js);
      }
        ).toList();

      print(pokemon);

      return pokemon;
    }
    return [];


  }

}