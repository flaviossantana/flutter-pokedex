import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/resources/values/api_url.dart';

class UtilImage {
  UtilImage();

  static Widget getImg(String numero, {double height, double width}) {
    return CachedNetworkImage(
      height: height ?? null,
      width: width ?? null,
      placeholder: (c, u) => new Container(
        color: Colors.transparent,
      ),
      imageUrl: URLApi.urlImage(numero),
    );
  }
}
