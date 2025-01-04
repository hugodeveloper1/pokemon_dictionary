import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon_dictionary/models/models.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_chain_model.dart';
import '../models/pokemon_specie_model.dart';

class PokemonUtils {
  static Future<Either<String, List<PokemonModel>>> getAllPokemons({
    int limit = 100,
  }) async {
    try {
      String url = 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=0';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>;

        final List<PokemonModel> pokemons = [];
        for (final result in results) {
          final detailResponse =
              await http.get(Uri.parse(result['url'] as String));
          if (detailResponse.statusCode == 200) {
            final detailData = jsonDecode(detailResponse.body);
            pokemons.add(PokemonModel.fromMap(detailData));
          }
        }
        return Right(pokemons);
      } else {
        return const Left('Ocurrio un error');
      }
    } catch (e) {
      return const Left('Ocurrio un error');
    }
  }

  static Future<Either<String, PokemonModel>> getPokemon({
    required String name,
  }) async {
    try {
      String url = 'https://pokeapi.co/api/v2/pokemon/$name';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(PokemonModel.fromMap(data));
      } else {
        return const Left('Ocurrio un error 1');
      }
    } catch (e) {
      return const Left('Ocurrio un error 2');
    }
  }

  static Future<Either<String, PokemonChainModel>> getEvolutionPokemon({
    required String url,
  }) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(PokemonChainModel.fromMap(data));
      } else {
        return const Left('Ocurrio un error');
      }
    } catch (e) {
      return const Left('Ocurrio un error');
    }
  }

  static Future<Either<String, PokemonSpecieModel>> getPokemonSpecies({
    required int id,
  }) async {
    try {
      String url = 'https://pokeapi.co/api/v2/pokemon-species/$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(PokemonSpecieModel.fromJson(data));
      } else {
        return const Left('Ocurrio un error');
      }
    } catch (e) {
      return const Left('Ocurrio un error');
    }
  }
}
