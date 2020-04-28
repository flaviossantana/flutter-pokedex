import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/UtilImage.dart';
import 'package:pokedex/resources/values/ui_text.dart';
import 'package:pokedex/stores/poke_api_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int idxPokemom;

  PokeDetailPage({this.idxPokemom});

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pgController;

  @override
  void initState() {
    super.initState();
    _pgController = PageController(initialPage: widget.idxPokemom);
  }

  @override
  Widget build(BuildContext context) {
    final PokeApiStore _pokeApiStore = Provider.of<PokeApiStore>(context);
    _pokeApiStore.getPokemom(widget.idxPokemom);
    return Scaffold(
      appBar: _pokeDetailAppBar(_pokeApiStore, context),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              _pokeApiStore.pokemom.getColor();
              return Container(
                color: _pokeApiStore.pokemom.getColor(),
              );
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 40,
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
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                  controller: _pgController,
                  onPageChanged: (idx) {
                    _pokeApiStore.setPokemonAtual(idx);
                  },
                  itemCount: _pokeApiStore.pokeApi.pokemon.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            UtilImage.getImg(
                              _pokeApiStore.getPokemom(index).num,
                              height: 180,
                              width: 180,
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pokeDetailAppBar(PokeApiStore pokeApiStore, BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Observer(builder: (BuildContext context) {
        return AppBar(
          title: UIText.textPrimary(
            pokeApiStore.pokemom.name.trim(),
            fontSize: 21,
          ),
          elevation: 0,
          backgroundColor: pokeApiStore.pokemom.getColor(),
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
      }),
    );
  }
}
