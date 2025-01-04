import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/utils/pokemon_utils.dart';

import '../models/models.dart';
import '../models/pokemon_chain_model.dart';
import '../models/pokemon_specie_model.dart';

enum StatusPage {
  initial,
  loading,
  success,
  error,
}

class PokemonController with ChangeNotifier {
  StatusPage _status = StatusPage.loading;
  StatusPage get status => _status;

  List<PokemonModel> _pokemons = [];
  List<PokemonModel> get pokemons => _pokemons;

  // Pokemon Details
  StatusPage _statusPokemon = StatusPage.loading;
  StatusPage get statusPokemon => _statusPokemon;

  PokemonModel? _pokemon;
  PokemonModel? get pokemon => _pokemon;

  PokemonSpecieModel? _speciePokemon;
  PokemonSpecieModel? get speciePokemon => _speciePokemon;

  // Evolution Pokemon Details
  /* StatusPage _statusEvolution = StatusPage.loading;
  StatusPage get statusEvolution => _statusEvolution; */

  PokemonChainModel? _evolutionPokemon;
  PokemonChainModel? get evolutionPokemon => _evolutionPokemon;

  void getAllPokemons() async {
    final response = await PokemonUtils.getAllPokemons();

    response.fold(
      (l) {
        _status = StatusPage.error;
        notifyListeners();
      },
      (r) {
        _status = StatusPage.success;
        _pokemons = r;
        notifyListeners();
      },
    );

    notifyListeners();
  }

  void getPokemon(String id) async {
    _statusPokemon = StatusPage.loading;

    final response = await PokemonUtils.getPokemon(name: id);

    response.fold(
      (l) {
        _statusPokemon = StatusPage.error;
        notifyListeners();
      },
      (pokemonDetail) async {
        final responseSpecies = await PokemonUtils.getPokemonSpecies(
          id: pokemonDetail.id,
        );

        responseSpecies.fold(
          (l) {
            _statusPokemon = StatusPage.error;
            notifyListeners();
          },
          (specie) async {
            final responseEvolution = await PokemonUtils.getEvolutionPokemon(
              url: specie.evolutionChainUrl,
            );

            responseEvolution.fold(
              (l) {
                _statusPokemon = StatusPage.error;
                notifyListeners();
              },
              (evolution) {
                _pokemon = pokemonDetail;
                _evolutionPokemon = evolution;
                _speciePokemon = specie;
                _statusPokemon = StatusPage.success;
                notifyListeners();
              },
            );

            notifyListeners();
          },
        );
      },
    );
  }

  /* void getEvolutionPokemon(String url) async {
    _statusEvolution = StatusPage.loading;

    final response = await PokemonUtils.getEvolutionPokemon(url: url);

    response.fold(
      (l) {
        _statusEvolution = StatusPage.error;
        notifyListeners();
      },
      (r) {
        _evolutionPokemon = r;
        _statusEvolution = StatusPage.success;
        notifyListeners();
      },
    );
  } */

  /* void closePokemonDetails() {
    _statusPokemon = StatusPage.loading;
    _statusEvolution = StatusPage.loading;
    notifyListeners();
  } */
}
