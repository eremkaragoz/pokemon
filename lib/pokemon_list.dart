import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/module/pokemonlar.dart';
import 'package:pokemon/pokemon_detail.dart';
import 'package:shimmer/shimmer.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokemonlar pokemonlar;
  Future<Pokemonlar> veri;


  Future<Pokemonlar>pokemonlariGetir() async{
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    pokemonlar = Pokemonlar.fromJson(decoded);
    return pokemonlar;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: OrientationBuilder(builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return FutureBuilder(future: veri, builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: snapshot.data.pokemon.length, itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonDetail(pokemon: snapshot.data.pokemon[index])));
                      },
                      child: Hero(tag: snapshot.data.pokemon[index].img, child: Card(
                        elevation: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: double.infinity/2,
                              height: MediaQuery.of(context).size.height/6,
                              child: FadeInImage(placeholder: NetworkImage("https://wpamelia.com/wp-content/uploads/2018/11/ezgif-2-6d0b072c3d3f.gif"), image: NetworkImage(snapshot.data.pokemon[index].img)),
                            ),

                            Text(snapshot.data.pokemon[index].name),
                          ],
                        ),
                      )),
                    ),
                  );
                });
              }
              else{
                return GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
                  return Padding(padding: EdgeInsets.all(10), child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/6,
                          width: double.infinity/2,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  );
                });

              }
            });
          }
          else {
            return FutureBuilder(future: veri, builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), itemCount: snapshot.data.pokemon.length, itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonDetail(pokemon: snapshot.data.pokemon[index])));
                      },
                      child: Hero(tag: snapshot.data.pokemon[index].img, child: Card(
                        elevation: 6,
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: double.infinity/2,
                              height: MediaQuery.of(context).size.height/6,
                              child: FadeInImage(placeholder: NetworkImage("https://wpamelia.com/wp-content/uploads/2018/11/ezgif-2-6d0b072c3d3f.gif"), image: NetworkImage(snapshot.data.pokemon[index].img),fit: BoxFit.contain,),
                            ),

                            Text(snapshot.data.pokemon[index].name),
                          ],
                        ),
                      )),
                    ),
                  );
                });
              }
              else{
                return GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
                  return Padding(padding: EdgeInsets.all(10), child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/6,
                          width: double.infinity/2,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  );
                });

              }
            });
          }
        },),
      ),
    );
  }
}
