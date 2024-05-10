import 'package:flutter/material.dart';
import 'package:pokefind/detail_screen.dart';

class Evolution extends StatelessWidget {
  const Evolution({
    super.key,
    required this.width,
    required this.widget,
    required this.category,
    required this.info,
    required this.text,
  });

  final double width;
  final PokemonDetailScreen widget;
  final String category;
  final String info;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.3,
            child: Text(category,
                style: const TextStyle(color: Colors.black, fontSize: 17)),
          ),
          Container(
              child: widget.pokemonDetail[info] != null
                  ? SizedBox(
                      height: 20,
                      width: width * 0.55,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.pokemonDetail[info].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              widget.pokemonDetail[info][index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                          );
                        },
                      ),
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ))
        ],
      ),
    );
  }
}
