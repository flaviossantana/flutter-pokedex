import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/model/poke_api.dart';
import 'package:pokedex/resources/values/api_url.dart';

part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI _pokeapi;

  @observable
  Pokemon _pokemon;

  PokeAPI get pokeApi => _pokeapi;

  @computed
  Pokemon get pokemom => _pokemon;

  _PokeApiStoreBase() {
    this._pokeapi = new PokeAPI();
    this._pokeapi.pokemon = new List();
  }

  @action
  setPokemonAtual(int index) {
    _pokemon = _pokeapi.pokemon[index];
  }

  @action
  Pokemon getPokemom(int idx) {
    return _pokeapi.pokemon[idx];
  }

  @action
  fetchPokemonList() {
    if (this._pokeapi.pokemon.isEmpty) {
      loadPokeApi().then((pokelist) {
        this._pokeapi = pokelist;
      });
    }
  }

  Future<PokeAPI> loadPokeApi() async {
    final response = await http.get(URLApi.UIR_POKEDEX);
    final dynamic decodeJson = jsonDecode(response.body);
    return PokeAPI.fromJson(decodeJson);
  }
}
