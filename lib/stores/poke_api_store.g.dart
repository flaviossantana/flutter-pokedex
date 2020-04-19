// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<Pokemon> _$pokemomComputed;

  @override
  Pokemon get pokemom =>
      (_$pokemomComputed ??= Computed<Pokemon>(() => super.pokemom)).value;

  final _$_pokeapiAtom = Atom(name: '_PokeApiStoreBase._pokeapi');

  @override
  PokeAPI get _pokeapi {
    _$_pokeapiAtom.context.enforceReadPolicy(_$_pokeapiAtom);
    _$_pokeapiAtom.reportObserved();
    return super._pokeapi;
  }

  @override
  set _pokeapi(PokeAPI value) {
    _$_pokeapiAtom.context.conditionallyRunInAction(() {
      super._pokeapi = value;
      _$_pokeapiAtom.reportChanged();
    }, _$_pokeapiAtom, name: '${_$_pokeapiAtom.name}_set');
  }

  final _$_pokemonAtom = Atom(name: '_PokeApiStoreBase._pokemon');

  @override
  Pokemon get _pokemon {
    _$_pokemonAtom.context.enforceReadPolicy(_$_pokemonAtom);
    _$_pokemonAtom.reportObserved();
    return super._pokemon;
  }

  @override
  set _pokemon(Pokemon value) {
    _$_pokemonAtom.context.conditionallyRunInAction(() {
      super._pokemon = value;
      _$_pokemonAtom.reportChanged();
    }, _$_pokemonAtom, name: '${_$_pokemonAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic setPokemonAtual(int index) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setPokemonAtual(index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Pokemon getPokemom(int idx) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemom(idx);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    final string = 'pokemom: ${pokemom.toString()}';
    return '{$string}';
  }
}
