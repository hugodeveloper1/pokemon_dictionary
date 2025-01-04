import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../controllers/pokemon_controller.dart';
import '../../models/models.dart';
import '../details/pokemon_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokemonController>(context, listen: false).getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokemonController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Dictionary'),
      ),
      body: _Body(
        status: controller.status,
        pokemons: controller.pokemons,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.status,
    required this.pokemons,
  });

  final StatusPage status;
  final List<PokemonModel> pokemons;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case StatusPage.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case StatusPage.success:
        return CustomDualView(
          items: pokemons,
          itemBuilder: (item) {
            return CustomCard(
              isShadow: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PokemonDetailsView(
                      id: item.name,
                      urlGif: item.urlGif,
                    );
                  },
                ));
              },
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: CachedGifViewer(
                        gifUrl: item.urlGif,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                    ),
                    child: Text(
                      item.name,
                    ),
                  ),
                ],
              ),
            );
          },
        );

      case StatusPage.error:
        return const Center(
          child: Text('Ocurrio un error'),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
