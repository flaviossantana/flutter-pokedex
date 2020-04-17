class URLApi {
  URLApi();

  static const String _BASE_URL = "https://raw.githubusercontent.com/";
  static const String _BASE_URL_BIUNI = "$_BASE_URL/Biuni";
  static const String UIR_POKEDEX =
      "$_BASE_URL_BIUNI/PokemonGO-Pokedex/master/pokedex.json";

  static urlImage(String numero) {
    return "$_BASE_URL/fanzeyi/pokemon.json/master/images/$numero.png";
  }
}
