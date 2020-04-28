import 'package:flutter/material.dart';
import 'package:pokedex/core/UtilColors.dart';
import 'package:pokedex/core/UtilImage.dart';
import 'package:pokedex/pages/home_page/widget/pokemom_tipos_list.dart';
import 'package:pokedex/pages/widget/poke_ball_bkg.dart';
import 'package:pokedex/resources/values/ui_text.dart';

class PokeItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem({
    this.nome,
    this.index,
    this.color,
    this.types,
    this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: UtilColors.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              PokeBallBKG(
                width: 110,
                height: 110,
                opacity: 0.2,
                tag: index.toString(),
              ),
              pokeImagem(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  pokeNome(),
                  pokeTipos(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding pokeTipos() {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: PokemonTipos(
        types: types,
      ),
    );
  }

  Padding pokeNome() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: UIText.textPrimary(
        nome.trim(),
        fontSize: 16,
      ),
    );
  }

  Align pokeImagem() {
    return Align(
      alignment: Alignment.bottomRight,
      child: UtilImage.getImg(
        num,
        height: 100,
        width: 100,
      ),
    );
  }
}
