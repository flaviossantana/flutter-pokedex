import 'package:flutter/material.dart';

class PokeItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final Widget imagem;

  PokeItem({
    this.nome,
    this.index,
    this.color,
    this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(nome),
            ),
            imagem,
          ],
        ),
      ),
    );
  }
}
