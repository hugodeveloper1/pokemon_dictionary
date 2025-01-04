import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/controllers/controller.dart';
import 'package:pokemon_dictionary/models/models.dart';
import 'package:pokemon_dictionary/models/pokemon_specie_model.dart';
import 'package:provider/provider.dart';

import 'pokemon_details_header.dart';
import 'pokemon_details_types.dart';
import 'sections/sections.dart';

enum PokemonDetailsSections {
  about,
  status,
  evolutions;

  String get name {
    switch (this) {
      case about:
        return 'About';

      case status:
        return 'Status';

      case evolutions:
        return 'Evolutions';
    }
  }
}

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({
    super.key,
    required this.id,
    required this.urlGif,
  });

  final String id;
  final String urlGif;

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  late PokemonController pokemonController;

  @override
  void initState() {
    super.initState();
    pokemonController = Provider.of<PokemonController>(context, listen: false);
    pokemonController.getPokemon(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokemonController>(context);

    return Scaffold(
      body: _Content(
        status: controller.statusPokemon,
        pokemon: controller.pokemon,
        speciePokemon: controller.speciePokemon,
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({
    required this.status,
    this.pokemon,
    this.speciePokemon,
  });

  final StatusPage status;
  final PokemonModel? pokemon;
  final PokemonSpecieModel? speciePokemon;

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: PokemonDetailsSections.values.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case StatusPage.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case StatusPage.error:
        return const Center(
          child: Text('Ocurrio un error'),
        );

      case StatusPage.success:
        return Column(
          children: [
            PokemonDetailsHeader(
              pokemon: widget.pokemon,
            ),
            const SizedBox(height: 10),
            PokemonDetailsTypes(
              pokemon: widget.pokemon,
            ),
            const SizedBox(height: 20),
            TabBar(
              controller: tabController,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: List.generate(
                PokemonDetailsSections.values.length,
                (index) {
                  return Tab(
                    text: PokemonDetailsSections.values[index].name,
                  );
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: List.generate(
                  PokemonDetailsSections.values.length,
                  (index) {
                    switch (PokemonDetailsSections.values[index]) {
                      case PokemonDetailsSections.about:
                        return PokemonDetailsAboutSection(
                          pokemon: widget.pokemon,
                        );

                      case PokemonDetailsSections.status:
                        return PokemonDetailsStatusSection(
                          pokemon: widget.pokemon,
                        );

                      case PokemonDetailsSections.evolutions:
                        return PokemonDetailsEvolutionsSection(
                          url: widget.speciePokemon?.evolutionChainUrl ?? '',
                        );
                    }
                  },
                ),
              ),
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
