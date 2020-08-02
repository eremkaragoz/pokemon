import 'package:flutter/material.dart';
import 'package:pokemon/module/pokemonlar.dart';

class PokemonDetail extends StatelessWidget {

  Pokemon pokemon;
  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget> [Positioned(
              height: MediaQuery.of(context).size.height*(2/3),
              width: MediaQuery.of(context).size.width-20,
              top: MediaQuery.of(context).size.height*0.1,
              child: Card(
                child: Text(pokemon.name, textAlign: TextAlign.center, ),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(tag: pokemon.img, child: Container(
                width: 200,
                height: 200,
                child: Image.network(pokemon.img),
              )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(pokemon.name),
                  Text(pokemon.height),
                  Text(pokemon.weight),

                ],
              ),
            )]
          ),
        ),
      ),
    );
  }
}
