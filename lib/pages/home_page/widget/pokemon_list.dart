import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/model/poke_api.dart';
import 'package:pokedex/pages/home_page/widget/poke_item.dart';
import 'package:pokedex/stores/poke_api_store.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore apiStore = PokeApiStore();
    apiStore.fetchPokemonList();

    return Expanded(
      child: Container(
        child: Observer(
          builder: (BuildContext context) {
            return AnimationLimiter(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: apiStore.pokeapi.pokemon.length,
                  itemBuilder: (c, idx) {
                    Pokemon pokemon = apiStore.getPokemom(idx);
                    return AnimationConfiguration.staggeredGrid(
                      position: idx,
                      columnCount: 2,
                      duration: Duration(milliseconds: 375),
                      child: ScaleAnimation(
                          child: GestureDetector(
                        child: PokeItem(
                          index: idx,
                          nome: pokemon.name,
                          types: pokemon.type,
                          num: pokemon.num,
                        ),
                        onTap: () {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Clique.'),
                            ),
                          );
                        },
                      )),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
