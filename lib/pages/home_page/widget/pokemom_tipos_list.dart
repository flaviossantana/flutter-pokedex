import 'package:flutter/material.dart';
import 'package:pokedex/resources/values/ui_text.dart';

class PokemonTipos extends StatelessWidget {
  final List<String> types;

  const PokemonTipos({Key key, this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = [];

    types.forEach((nome) {
      lista.add(Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(80, 255, 255, 255),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: UIText.textPrimary(
                nome.trim(),
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ));
    });

    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
