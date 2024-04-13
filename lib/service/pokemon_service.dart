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

      print(json);

      final pokemon = json.map((e) {
        return Pokemon(
          id: e['id'],
          num: e['num'],
          name: e['name'],
          img: e['img'],
          type: e['type'],
          height: e['height'],
          weight: e['weight'],
          candy: e['candy'],
          candy_count: e['candy_count'],
          egg: e['egg'],
          spawn_chance: e['spawn_chance'].toDouble(), // cast to double as it may dynamically cast to int for whole number values
          avg_spawn: e['avg_spawn'],
          spawn_time: e['spawn_time'],
          multipliers: e['multipliers'],
          weaknesses: e['weaknesses'],
          pre_evo:e['pre_evo'] != null? e['pre_evo'].toList().map((evo){
            return evolution(name: evo['name'], num: evo['num']);
          }).toList(): [],
          next_evo: e['next_evo'] != null? e['next_evo'].toList().map((evo){
          return evolution(name: evo['name'], num: evo['num']);
          }).toList(): [], // mapping for list of evolutions
        );
      }).toList();

      return pokemon;
    }
    return [];


  }

}