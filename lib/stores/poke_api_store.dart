import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/model/poke_api.dart';

part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeapi;

  _PokeApiStoreBase() {
    this.pokeapi = new PokeAPI();
    this.pokeapi.pokemon = new List();
  }

  @action
  fetchPokemonList() {
    loadPokeApi().then((pokelist) {
      this.pokeapi = pokelist;
    });
  }

  Future<PokeAPI> loadPokeApi() async {
    try {
      final response = await http.get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

      final dynamic decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      return new PokeAPI();
    }
  }
}
