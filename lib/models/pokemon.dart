
import 'dart:ffi';


class evolution{
  String num;
  String name;

  evolution({
    required this.name,
    required this.num,
});
}
class Pokemon{
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
  List<evolution> pre_evo;
  List<evolution> next_evo;


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
}