class PokemonEvolutionModel {
  final int minLevel;

  PokemonEvolutionModel({
    required this.minLevel,
  });

  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionModel(
      minLevel: int.tryParse((json['min_level'] ?? '0').toString()) ?? 0,
    );
  }
}
