import 'package:flutter/material.dart';
import 'package:pokedex/core/UtilImage.dart';
import 'package:pokedex/model/poke_api.dart';
import 'package:pokedex/resources/values/ui_text.dart';
import 'package:pokedex/stores/poke_api_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatelessWidget {
  final int idx;

  const PokeDetailPage({Key key, this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokeApiStore _pokeApiStore = Provider.of<PokeApiStore>(context);
    Pokemon pokemom = _pokeApiStore.getPokemom(idx);
    return Scaffold(
      appBar: _pokeDetailAppBar(pokemom, context),
      backgroundColor: pokemom.getColor(),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (c, s) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("oi Olá"),
                ),
              );
            },
          ),
          Positioned(
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                  itemCount: _pokeApiStore.pokeapi.pokemon.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UtilImage.getImg(
                        _pokeApiStore.getPokemom(index).num);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _pokeDetailAppBar(Pokemon pokemom, BuildContext context) {
    return AppBar(
      title: UIText.textPrimary(
        pokemom.name.trim(),
        fontSize: 21,
      ),
      elevation: 0,
      backgroundColor: pokemom.getColor(),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
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
