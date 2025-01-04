class PokemonAbilityModel {
  final AbilityModel? ability;
  final bool isHidden;
  final int slot;

  PokemonAbilityModel({
    this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      ability: json['ability'] != null
          ? AbilityModel.fromJson(json['ability'])
          : null,
      isHidden: json['is_hidden'] ?? false,
      slot: json['slot'] ?? 0,
    );
  }
}

class AbilityModel {
  final String name;
  final String url;

  AbilityModel({
    required this.name,
    required this.url,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
