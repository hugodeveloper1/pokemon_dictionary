class PokemonStatsModel {
  final double baseStat;
  final int effort;
  final StartsModel? stat;

  PokemonStatsModel({
    required this.baseStat,
    required this.effort,
    this.stat,
  });

  factory PokemonStatsModel.fromMap(Map<String, dynamic> map) {
    /* final stat = map['stat'] != null ? StartsModel.fromMap(map['stat']) : null;
    final effort = int.tryParse((map['effort'] ?? '0').toString()) ?? 0;

    double result = calculateStat(
      stat: stat!,
      iv: 31,
      level: 100,
      natureModifier: 1.0,
      isHP: (stat.name) == 'hp',
    ); */

    /* final result = calculateStat(
      baseStat: int.tryParse((map['base_stat'] ?? '0').toString()) ?? 0,
      effort: effort,
      iv: iv,
      level: level,
      natureModifier: natureModifier,
      isHP: (stat?.name ?? '') == 'hp',
    ); */

    return PokemonStatsModel(
      baseStat: double.tryParse((map['base_stat'] ?? '0').toString()) ?? 0,
      effort: int.tryParse((map['effort'] ?? '0').toString()) ?? 0,
      stat: map['stat'] != null ? StartsModel.fromMap(map['stat']) : null,
    );
  }
}

class StartsModel {
  final String name;
  final String url;

  StartsModel({
    required this.name,
    required this.url,
  });

  factory StartsModel.fromMap(Map<String, dynamic> map) {
    return StartsModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
