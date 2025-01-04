import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/colors_utils.dart';
import '../../widgets/widgets.dart';

class PokemonDetailsTypes extends StatelessWidget {
  const PokemonDetailsTypes({
    super.key,
    this.pokemon,
  });

  final PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate((pokemon?.types ?? []).length, (index) {
        final item = (pokemon?.types ?? [])[index];

        return CustomCard(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          backgroundColor: ColorsUtils.hexToColor(
            item.type?.color?.color ?? '',
          ),
          child: Text(
            item.type?.name ?? '',
            style: textTheme.bodySmall!.copyWith(
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
