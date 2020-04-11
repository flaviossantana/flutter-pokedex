import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/model/poke_api.dart';
import 'package:pokedex/resources/values/api_url.dart';

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
    final response = await http.get(URLApi.UIR_POKEDEX);
    final dynamic decodeJson = jsonDecode(response.body);
    return PokeAPI.fromJson(decodeJson);
  }
}
