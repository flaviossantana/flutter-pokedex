import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    );
  }
}
