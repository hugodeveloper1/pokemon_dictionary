import 'pokemon_status_enum.dart';

class PokemonTypeModel {
  final int slot;
  final TypeModel? type;

  PokemonTypeModel({
    required this.slot,
    this.type,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: int.tryParse((json['slot'] ?? '0').toString()) ?? 0,
      type: json['type'] != null ? TypeModel.fromJson(json['type']) : null,
    );
  }
}

class TypeModel {
  final String name;
  final String url;
  final PokemonType? color;

  TypeModel({
    required this.name,
    required this.url,
    this.color,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? '';

    return TypeModel(
      name: name,
      url: json['url'] ?? '',
      color: name.isNotEmpty ? pokemonTypeValues.map[name] : null,
    );
  }
}
