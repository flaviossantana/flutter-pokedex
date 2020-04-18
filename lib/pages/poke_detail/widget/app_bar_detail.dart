import 'package:flutter/material.dart';
import 'package:pokedex/model/poke_api.dart';
import 'package:pokedex/resources/values/ui_text.dart';

class AppBarPokeDetail extends StatelessWidget {
  final Pokemon pokemom;

  const AppBarPokeDetail({this.pokemom});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: UIText.textPrimary(
        pokemom.name.trim(),
        fontSize: 21,
      ),
      elevation: 0,
      backgroundColor: pokemom.getColor(),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}
