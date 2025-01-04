import 'pokemon_ability_model.dart';
import 'pokemon_stats_model.dart';
import 'pokemon_type_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final String urlGif;
  final int baseExperience;
  final double height;
  final double weight;

  final List<PokemonTypeModel> types;
  final List<PokemonAbilityModel> abilities;
  final List<PokemonStatsModel> stats;

  PokemonModel({
    required this.id,
    required this.name,
    required this.urlGif,
    this.baseExperience = 0,
    this.height = 0,
    this.weight = 0,
    this.types = const [],
    this.stats = const [],
    this.abilities = const [],
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    String name = map['name'] ?? '';
    String gif = 'https://play.pokemonshowdown.com/sprites/ani/$name.gif';

    return PokemonModel(
      id: int.tryParse((map['id'] ?? '0').toString()) ?? 0,
      name: name,
      urlGif: gif,
      baseExperience: int.tryParse((map['name'] ?? '0').toString()) ?? 0,
      height: double.tryParse((map['height'] ?? '0').toString()) ?? 0,
      weight: double.tryParse((map['weight'] ?? '0').toString()) ?? 0,
      types: ((map['types'] ?? []) as List).map((e) {
        return PokemonTypeModel.fromJson(e);
      }).toList(),
      stats: ((map['stats'] ?? []) as List).map((e) {
        return PokemonStatsModel.fromMap(e);
      }).toList(),
      abilities: ((map['abilities'] ?? []) as List).map((e) {
        return PokemonAbilityModel.fromJson(e);
      }).toList(),
    );
  }
}
