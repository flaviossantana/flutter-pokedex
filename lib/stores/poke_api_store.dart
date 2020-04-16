import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  @action
  getPokemom(int idx) {
    return pokeapi.pokemon[idx];
  }

  Future<PokeAPI> loadPokeApi() async {
    final response = await http.get(URLApi.UIR_POKEDEX);
    final dynamic decodeJson = jsonDecode(response.body);
    return PokeAPI.fromJson(decodeJson);
  }

  @action
  Widget getImg(String numero) {
    return CachedNetworkImage(
      placeholder: (c, u) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }
}
