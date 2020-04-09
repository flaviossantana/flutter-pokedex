import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/widget/titulo_bar_home.dart';

import 'menu-sanduiche.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: <Widget>[
          MenuSanduiche(),
          TituloBarHome('Pokedex'),
        ],
      ),
    );
  }
}
