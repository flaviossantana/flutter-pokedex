import 'package:flutter/material.dart';
import 'package:pokedex/resources/values/ui_image.dart';

class PokeBallBKG extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;
  final Object tag;
  final Alignment alignment;

  PokeBallBKG({
    this.width,
    this.height,
    this.opacity,
    this.tag,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment ?? Alignment.bottomRight,
      child: Hero(
        tag: this.tag,
        child: Opacity(
          opacity: this.opacity ?? 0.2,
          child: Image.asset(
            UIImage.POKEBALL,
            width: this.width ?? 110,
            height: this.width ?? 110,
          ),
        ),
      ),
    );
    ;
  }
}
