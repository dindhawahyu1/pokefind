import 'package:flutter/material.dart';
import 'package:pokefind/detail_screen.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
    required this.width,
    required this.widget,
    required this.info,
    required this.category,
  });

  final double width;
  final PokemonDetailScreen widget;
  final String info;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: width * 0.3,
              child: Text(
                category,
                style: const TextStyle(color: Colors.black, fontSize: 17),
              )),
          SizedBox(
              width: width * 0.3,
              child: Text(
                widget.pokemonDetail[info],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17),
              )),
        ],
      ),
    );
  }
}
