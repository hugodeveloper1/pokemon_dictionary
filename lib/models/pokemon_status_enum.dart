import 'enum_values.dart';

enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy;

  String get color {
    switch (this) {
      case PokemonType.normal:
        return '#A8A878';
      case PokemonType.fighting:
        return '#C03028';
      case PokemonType.flying:
        return '#A890F0';
      case PokemonType.poison:
        return '#A040A0';
      case PokemonType.ground:
        return '#E0C068';
      case PokemonType.rock:
        return '#B8A038';
      case PokemonType.bug:
        return '#A8B820';
      case PokemonType.ghost:
        return '#705898';
      case PokemonType.steel:
        return '#B8B8D0';
      case PokemonType.fire:
        return '#F08030';
      case PokemonType.water:
        return '#6890F0';
      case PokemonType.grass:
        return '#78C850';
      case PokemonType.electric:
        return '#F8D030';
      case PokemonType.psychic:
        return '#F85888';
      case PokemonType.ice:
        return '#98D8D8';
      case PokemonType.dragon:
        return '#7038F8';
      case PokemonType.dark:
        return '#705848';
      case PokemonType.fairy:
        return '#EE99AC';
      default:
        return '#FFFFFF'; // Default color (White) in case of an unknown type
    }
  }
}

final pokemonTypeValues = EnumValues({
  "normal": PokemonType.normal, // 'A8A878',
  "fighting": PokemonType.fighting, // 'C03028',
  "flying": PokemonType.flying, // 'A890F0',
  "poison": PokemonType.poison, // 'A040A0',
  "ground": PokemonType.ground, // 'E0C068',
  "rock": PokemonType.rock, // 'B8A038',
  "bug": PokemonType.bug, // 'A8B820',
  "ghost": PokemonType.ghost, // '705898',
  "steel": PokemonType.steel, // 'B8B8D0',
  "fire": PokemonType.fire, // 'F08030',
  "water": PokemonType.water, // '6890F0',
  "grass": PokemonType.grass, // '78C850',
  "electric": PokemonType.electric, // 'F8D030',
  "psychic": PokemonType.psychic, // 'F85888',
  "ice": PokemonType.ice, //  '98D8D8',
  "dragon": PokemonType.dragon, //  '7038F8',
  "dark": PokemonType.dark, //  '705848',
  "fairy": PokemonType.fairy, //  'EE99AC',
});
