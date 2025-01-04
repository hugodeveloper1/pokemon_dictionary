import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/controllers/controller.dart';
import 'package:provider/provider.dart';

import '../../../models/pokemon_evolves_to_model.dart';
import '../../../widgets/widgets.dart';

class PokemonDetailsEvolutionsSection extends StatefulWidget {
  const PokemonDetailsEvolutionsSection({
    super.key,
    this.url = '',
  });

  final String url;

  @override
  State<PokemonDetailsEvolutionsSection> createState() =>
      _PokemonDetailsEvolutionsSectionState();
}

class _PokemonDetailsEvolutionsSectionState
    extends State<PokemonDetailsEvolutionsSection> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokemonController>(context);

    return (controller.evolutionPokemon?.chain?.evolvesTo ?? []).isEmpty
        ? const Center(
            child: Text(
              'This Pokémon does not have an evolution.',
            ),
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                CachedGifViewer(
                  gifUrl:
                      controller.evolutionPokemon?.chain?.species?.url ?? '',
                ),
                _List(
                  list: controller.evolutionPokemon?.chain?.evolvesTo ?? [],
                ),
              ],
            ),
          );
  }
}

class _List extends StatelessWidget {
  const _List({
    required this.list,
  });

  final List<PokemonEvolvesToModel> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              ...list.map((e) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    CachedGifViewer(
                      gifUrl: e.species?.url ?? '',
                    ),
                    const SizedBox(height: 15),
                    _List(
                      list: e.evolvesTo,
                    ),
                  ],
                );
              }),
            ],
          );
  }
}
