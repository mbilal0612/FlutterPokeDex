import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetails({super.key, required this.pokemon});

  @override
  State<PokemonDetails> createState() => _PokemonDetails();
}

final Map<String, Color> typeColors = {
  'Normal':
      Colors.grey, // Replace 'Normal color code' with the actual color code
  'Fire': Colors.red,
  'Water': Colors.blue,
  'Electric': Colors.yellow,
  'Flying': Colors.pink,
  'Poison': Colors.deepPurpleAccent,
  'Psychic': Colors.purpleAccent,
  'Rock': Colors.brown,
  'Fighting': Colors.brown,
  'Ground': Colors.brown,
  'Grass': Colors.green,
  'Bug': Colors.greenAccent,
  // Add more types and their corresponding colors as needed
};

class _PokemonDetails extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: typeColors[widget.pokemon.type[0]],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: DetailsCard(widget: widget),
              ),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 70,
                        left: 100,
                        child: Hero(
                            tag: 'img${widget.pokemon.num}',
                            child: SizedBox(
                              height: 250,
                              width: 250,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(widget.pokemon.img,
                                    fit: BoxFit.cover),
                              ),
                            ))),
                    Positioned(
                      top: 5,
                      left: 10,
                      child: Text(
                        widget.pokemon.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Text(
                        "#${widget.pokemon.num}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 4.0),
                            child: Text(
                              widget.pokemon.type
                                  .toString()
                                  .replaceFirst("[", "")
                                  .replaceFirst("]", ""),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   child: Card( child:Text(widget.pokemon.name))
            // )
          ],
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.widget,
  });

  final PokemonDetails widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Name",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 90,
              ),
              Text(widget.pokemon.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Height",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width:90,
              ),
              Text(widget.pokemon.height,
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Weight",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 90,
              ),
              Text(widget.pokemon.weight,
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Spawn Time",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 40,
              ),
              Text(widget.pokemon.spawn_time,
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Weakness",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 60,
              ),
              Text(
                  widget.pokemon.weaknesses.toString().substring(
                      1, widget.pokemon.weaknesses.toString().length - 1),
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Pre Evolution",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 30,
              ),
              Text(
                  widget.pokemon.pre_evo!.length != 0
                      ? widget.pokemon.pre_evo!
                          .map((e) {
                            return e['name'];
                          })
                          .toList()
                          .toString()
                          .replaceAll("]", "")
                          .replaceFirst("[", "")
                      : "Just Hatched",
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Next Evolution",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(
                width: 20,
              ),
              Text(
                  widget.pokemon.next_evo?.length == 0
                      ? "Maxed Out"
                      : widget.pokemon.next_evo!
                          .map((e) {
                            return e['name'];
                          })
                          .toList()
                          .toString()
                          .replaceAll("]", "")
                          .replaceFirst("[", ""),
                  style: const TextStyle(fontSize: 20, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
