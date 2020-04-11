import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/pages/home_page/widget/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widget/pokeball_dark_image.dart';
import 'package:pokedex/pages/home_page/widget/status_bar_home.dart';
import 'package:pokedex/resources/values/ui_image.dart';
import 'package:pokedex/stores/poke_api_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore apiStore = PokeApiStore();
    apiStore.fetchPokemonList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          PokeballDarkImage(UIImage.POKEBALL_DARK),
          Container(
            child: Column(
              children: <Widget>[
                StatusBarHome(),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        return ListView.builder(
                            itemCount: apiStore.pokeapi.pokemon.length,
                            itemBuilder: (c, i) {
                              return ListTile(
                                title: Text(apiStore.pokeapi.pokemon[i].name),
                              );
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
