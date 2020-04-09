import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/widget/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widget/pokeball_dark_image.dart';
import 'package:pokedex/pages/home_page/widget/status_bar_home.dart';
import 'package:pokedex/resources/values/ui_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          PokeballDarkImage(UIImage.POKEBALL_DARK),
          Container(
            child: Column(
              children: <Widget>[
                StatusBarHome(),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                        ListTile(
                          title: Text('Pokemom'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
