import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/core/UtilImage.dart';
import 'package:pokedex/pages/widget/poke_ball_bkg.dart';
import 'package:pokedex/resources/values/ui_text.dart';
import 'package:pokedex/stores/poke_api_store.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int idxPokemom;

  PokeDetailPage({this.idxPokemom});

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pgController;
  MultiTrackTween _animation;

  @override
  void initState() {
    _pgController = PageController(initialPage: widget.idxPokemom);
    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
          curve: Curves.linear),
    ]);
    super.initState();
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
            cornerRadius: 30,
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
            padding: EdgeInsets.only(top: 40),
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
                        ControlledAnimation(
                          playback: Playback.LOOP,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              angle: animation["rotation"],
                              child: PokeBallBKG(
                                tag: index.toString(),
                                alignment: Alignment.center,
                                height: 500,
                                width: 500,
                                opacity: 0.2,
                              ),
                            );
                          },
                        ),
                        UtilImage.getImg(
                          _pokeApiStore.getPokemom(index).num,
                          height: 160,
                          width: 160,
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
