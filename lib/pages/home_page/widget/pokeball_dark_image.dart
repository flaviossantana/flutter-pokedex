import 'package:flutter/material.dart';

class PokeballDarkImage extends StatelessWidget {
  final String image;

  PokeballDarkImage(this.image);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: -(240 / 4.7),
      left: screenWidth - (240 / 1.6),
      child: Opacity(
        child: Image.asset(
          this.image,
          width: 240,
          height: 240,
        ),
        opacity: 0.1,
      ),
    );
  }
}
