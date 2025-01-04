import 'package:pokemon_dictionary/models/pokemon_specie_model.dart';

import 'pokemon_evolution_model.dart';

class PokemonEvolvesToModel {
  final List<PokemonEvolutionModel> evolutionDetails;
  final List<PokemonEvolvesToModel> evolvesTo;
  final bool isBaby;
  final PokemonSpecieModel? species;

  PokemonEvolvesToModel({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    this.species,
  });

  factory PokemonEvolvesToModel.fromJson(Map<String, dynamic> json) {
    return PokemonEvolvesToModel(
      evolutionDetails: ((json['evolution_details'] ?? []) as List)
          .map((e) => PokemonEvolutionModel.fromJson(e))
          .toList(),
      evolvesTo: ((json['evolves_to'] ?? []) as List)
          .map((e) => PokemonEvolvesToModel.fromJson(e))
          .toList(),
      isBaby: json['is_baby'] ?? false,
      species: json['species'] != null
          ? PokemonSpecieModel.fromJson(json['species'])
          : null,
    );
  }
}
