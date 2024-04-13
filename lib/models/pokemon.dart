import 'dart:ffi';

class evolution{
  String num;
  String name;

  evolution({
    required this.name,
    required this.num,
  });

  factory evolution.fromJson(Map<String, dynamic> json) {
    return evolution(name: json['name'], num: json['num']);
  }
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<dynamic> type;
  String height;
  String weight;
  String candy;
  int? candy_count;
  String egg;
  double spawn_chance;
  double? avg_spawn;
  String spawn_time;
  List<dynamic>? multipliers;
  List<dynamic> weaknesses; // convert to an array
  List<Map<String, dynamic>>? pre_evo;
  List<Map<String, dynamic>>? next_evo;
  // List<evolution>? pre_evo;
  // List<evolution>? next_evo;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candy_count,
    required this.egg,
    required this.spawn_chance,
    required this.avg_spawn,
    required this.spawn_time,
    required this.multipliers,
    required this.weaknesses,
    required this.pre_evo,
    required this.next_evo,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: json['type'],
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candy_count: json['candy_count'],
      egg: json['egg'],
      spawn_chance: json['spawn_chance'].toDouble(),
      // cast to double as it may dynamically cast to int for whole number values
      avg_spawn: json['avg_spawn'],
      spawn_time: json['spawn_time'],
      multipliers: json['multipliers'],
      weaknesses: json['weaknesses'],
      // pre_evo: json['previous_evolution'] != null
      //     ? json['previous_evolution'].map((evo){
      //       return evolution.fromJson(evo);
      // }) as List<evolution>
      //     : [],
      // next_evo: json['next_evolution'] != null
      //     ? json['next_evolution'].map((evo){
      //   return evolution.fromJson(evo);
      // }) as List<evolution>
      //     : [], //
      pre_evo: json['prev_evolution'] != null
          ? List<Map<String, dynamic>>.from(json['prev_evolution'])
          : [],
      next_evo: json['next_evolution'] != null
          ? List<Map<String, dynamic>>.from(json['next_evolution'])
          : [], // mapping for list of evolutions
    );
  }
}
