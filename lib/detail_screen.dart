import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokefind/details_widget.dart';
import 'package:pokefind/evolution_widget.dart';

class PokemonDetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pokemonDetail;
  final Color color;
  final int heroTag;
  const PokemonDetailScreen(
      {super.key,
      this.pokemonDetail,
      required this.color,
      required this.heroTag});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26),
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    widget.pokemonDetail['type'].join(", "),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ),
          Positioned(
            top: height * 0.23,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    PokemonDetails(
                      category: "Number",
                      width: width,
                      widget: widget,
                      info: 'num',
                    ),
                    PokemonDetails(
                        category: "Name",
                        width: width,
                        widget: widget,
                        info: 'name'),
                    PokemonDetails(
                      category: "Height",
                      width: width,
                      widget: widget,
                      info: 'height',
                    ),
                    PokemonDetails(
                        category: "Weight",
                        width: width,
                        widget: widget,
                        info: 'weight'),
                    PokemonDetails(
                      category: "Spawn Time",
                      width: width,
                      widget: widget,
                      info: 'spawn_time',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text("Weakness",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17)),
                          ),
                          SizedBox(
                              width: width * 0.3,
                              child: Text(
                                widget.pokemonDetail['weaknesses'].join(", "),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17),
                              ))
                        ],
                      ),
                    ),
                    Evolution(
                        width: width,
                        widget: widget,
                        category: 'Prev Evolution',
                        info: 'prev_evolution',
                        text: "Just Hatched"),
                    Evolution(
                        width: width,
                        widget: widget,
                        category: 'Next Evolution',
                        info: 'next_evolution',
                        text: "Maxed Out"),
                    PokemonDetails(
                      category: "Egg Hatch",
                      width: width,
                      widget: widget,
                      info: 'egg',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.23,
              left: (width / 2) - 100,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetail['img'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.fitHeight,
                ),
              ))
        ],
      ),
    );
  }
}
