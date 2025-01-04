class PokemonSpecieModel {
  final String name;
  final String url;
  final String color;
  final String evolutionChainUrl;

  PokemonSpecieModel({
    required this.name,
    required this.url,
    this.color = '',
    this.evolutionChainUrl = '',
  });

  factory PokemonSpecieModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? '';
    String gif = 'https://play.pokemonshowdown.com/sprites/ani/$name.gif';

    return PokemonSpecieModel(
      name: name,
      url: gif,
      color: json['color'] != null ? json['color']['name'] ?? '' : '',
      evolutionChainUrl: json['evolution_chain'] != null
          ? json['evolution_chain']['url'] ?? ''
          : '',
    );
  }
}
