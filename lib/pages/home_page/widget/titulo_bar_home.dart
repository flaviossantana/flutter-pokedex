import 'package:flutter/material.dart';

class TituloBarHome extends StatelessWidget {
  final String titulo;

  TituloBarHome(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            this.titulo,
            style: TextStyle(
                fontFamily: 'Google',
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
        ),
      ],
    );
  }
}
