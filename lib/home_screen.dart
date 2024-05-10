import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokefind/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  List<dynamic> pokedex = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: -40,
                right: -70,
                child: Image.asset(
                  'images/pokeball.png',
                  width: 250,
                  fit: BoxFit.fitHeight,
                )),
            const Positioned(
                top: 80,
                left: 20,
                child: Text(
                  "Pokedex",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 150,
              bottom: 0,
              width: width,
              child: Column(
                children: [
                  // ignore: unnecessary_null_comparison
                  pokedex != null
                      ? Expanded(
                          child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.4),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return Card(
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: type == 'Grass'
                                            ? Colors.greenAccent
                                            : type == 'Fire'
                                                ? Colors.redAccent
                                                : type == 'Water'
                                                    ? Colors.blueAccent
                                                    : type == 'Electric'
                                                        ? Colors.yellow
                                                        : type == 'Rock'
                                                            ? Colors.grey
                                                            : type == 'Ground'
                                                                ? Colors.brown
                                                                : type ==
                                                                        'Psychic'
                                                                    ? Colors
                                                                        .pink
                                                                    : type ==
                                                                            'Fighting'
                                                                        ? Colors
                                                                            .orange
                                                                        : type ==
                                                                                'Bug'
                                                                            ? Colors.lightGreenAccent
                                                                            : type == 'Ghost'
                                                                                ? Colors.deepPurple
                                                                                : type == 'Normal'
                                                                                    ? const Color.fromARGB(255, 184, 117, 92)
                                                                                    : Colors.purple,
                                        borderRadius: BorderRadiusDirectional.circular(20)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: -10,
                                          right: -10,
                                          child: Image.asset(
                                            'images/pokeball.png',
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Positioned(
                                            top: 30,
                                            left: 10,
                                            child: Text(
                                              pokedex[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Positioned(
                                          top: 60,
                                          left: 10,
                                          child: Container(
                                            // ignore: sort_child_properties_last
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 4,
                                                  bottom: 4),
                                              child: Text(
                                                type.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.black26),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Hero(
                                              tag: index,
                                              child: CachedNetworkImage(
                                                imageUrl: pokedex[index]['img'],
                                                height: 100,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PokemonDetailScreen(
                                                color: type == 'Grass'
                                                    ? Colors.greenAccent
                                                    : type == 'Fire'
                                                        ? Colors.redAccent
                                                        : type == 'Water'
                                                            ? Colors.blueAccent
                                                            : type == 'Electric'
                                                                ? Colors.yellow
                                                                : type == 'Rock'
                                                                    ? Colors
                                                                        .grey
                                                                    : type ==
                                                                            'Ground'
                                                                        ? Colors
                                                                            .brown
                                                                        : type ==
                                                                                'Psychic'
                                                                            ? Colors.pink
                                                                            : type == 'Fighting'
                                                                                ? Colors.orange
                                                                                : type == 'Bug'
                                                                                    ? Colors.lightGreenAccent
                                                                                    : type == 'Ghost'
                                                                                        ? Colors.deepPurple
                                                                                        : type == 'Normal'
                                                                                            ? const Color.fromARGB(255, 184, 117, 92)
                                                                                            : Colors.purple,
                                                heroTag: index,
                                                pokemonDetail: pokedex[index],
                                              )));
                                },
                              ),
                            );
                          },
                        ))
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ),
            ),
          ],
        ));
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        pokedex = data['pokemon'];
        setState(() {});
      }
    });
  }
}
