
import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
        title: 'pokedex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Pokedex'),
      ),
    );

    // return
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.white,
          title: Padding(padding:const EdgeInsets.fromLTRB(0, 100, 0, 0) ,child:Text(widget.title,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey))),
        ),
        body: Consumer<PokemonProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final pokemon = value.pokemon;
          return SafeArea(
              child: GridView.builder(
                  itemCount: pokemon.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.45,
                      crossAxisCount: 2,
                      mainAxisSpacing: 7.0,
                      crossAxisSpacing: 7.0),
                  itemBuilder: (_, index) => GestureDetector(
                    child: PokemonCard(pokemon:pokemon[index]),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PokemonDetails(pokemon:pokemon[index]);
                      }));
                    },
                  )));
        })
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return
      Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      color: typeColors[pokemon.type[0]],
      child: Stack(
        children: [
          Positioned(
            right: 7,
            top: 20,
            child: Image.network(pokemon.img),
          ),
          Positioned(
              top: 30,
              left: 10,
              child: Text(
                pokemon.name,
                style: const TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          // Positioned(
          //     top: 60,
          //     left: 5,
          //     child:
          //     Chip(
          //       elevation:5,
          //       backgroundColor: Colors.transparent,
          //       // backgroundColor: Colors.black.withAlpha(200),
          //       surfaceTintColor: Colors.blue,
          //       visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(40)
          //       ),
          //       label: Text(pokemon.type[0],
          //           style: const TextStyle(color: Colors.white)),
          //
          //
          //       //   Row(
          //       // children: pokemon.type
          //       //     .map((t) => Chip(
          //       //           label: Text(t,style:const TextStyle(color:  Colors.white),),
          //       //           backgroundColor: Colors.black.withOpacity(0.75),
          //       //         ))
          //       //     .toList(),
          //     ),
          Positioned(

            top:55,left: 5,
            child: Card(
              color:Colors.black.withOpacity(0.5),
              child: Padding(padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),child: Text(pokemon.type[0], style: const TextStyle(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
