// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  final _$pokeapiAtom = Atom(name: '_PokeApiStoreBase.pokeapi');

  @override
  PokeAPI get pokeapi {
    _$pokeapiAtom.context.enforceReadPolicy(_$pokeapiAtom);
    _$pokeapiAtom.reportObserved();
    return super.pokeapi;
  }

  @override
  set pokeapi(PokeAPI value) {
    _$pokeapiAtom.context.conditionallyRunInAction(() {
      super.pokeapi = value;
      _$pokeapiAtom.reportChanged();
    }, _$pokeapiAtom, name: '${_$pokeapiAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemom(int idx) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemom(idx);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pokeapi: ${pokeapi.toString()}';
    return '{$string}';
  }
}
