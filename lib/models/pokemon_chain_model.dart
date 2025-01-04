import 'pokemon_evolves_to_model.dart';
import 'pokemon_specie_model.dart';

class PokemonChainModel {
  final ChainModel? chain;

  PokemonChainModel({
    this.chain,
  });

  factory PokemonChainModel.fromMap(Map<String, dynamic> map) {
    return PokemonChainModel(
      chain: map['chain'] != null ? ChainModel.fromJson(map['chain']) : null,
    );
  }
}

class ChainModel {
  final List<PokemonEvolvesToModel> evolvesTo;
  final bool isBaby;
  final PokemonSpecieModel? species;

  ChainModel({
    this.isBaby = false,
    this.species,
    this.evolvesTo = const [],
  });

  factory ChainModel.fromJson(Map<String, dynamic> json) {
    return ChainModel(
      isBaby: json['is_baby'] ?? false,
      species: json['species'] != null
          ? PokemonSpecieModel.fromJson(json['species'])
          : null,
      evolvesTo: ((json['evolves_to'] ?? []) as List)
          .map((e) => PokemonEvolvesToModel.fromJson(e))
          .toList(),
    );
  }
}
