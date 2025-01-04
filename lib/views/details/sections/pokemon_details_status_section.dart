import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/models/pokemon_model.dart';

import '../../../utils/colors_utils.dart';
import '../../../widgets/percentage_bar.dart';

class PokemonDetailsStatusSection extends StatelessWidget {
  const PokemonDetailsStatusSection({
    super.key,
    this.pokemon,
  });

  final PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        children: [
          ...(pokemon?.stats ?? []).map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      e.stat?.name ?? '',
                      style: textTheme.bodyMedium!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    child: Center(
                      child: Text(
                        e.baseStat.toString(),
                        style: textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PercentageBar(
                      stat: e,
                      color: ColorsUtils.hexToColor(
                        pokemon?.types[0].type?.color?.color ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
