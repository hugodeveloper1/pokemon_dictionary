import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/models/pokemon_model.dart';

import '../../../widgets/widgets.dart';

class PokemonDetailsAboutSection extends StatelessWidget {
  const PokemonDetailsAboutSection({
    super.key,
    this.pokemon,
  });

  final PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _Text(
                title: 'Weight',
                value: '${(pokemon?.weight ?? 0)} Kg',
              ),
              const SizedBox(width: 15),
              _Text(
                title: 'Height',
                value: '${(pokemon?.height ?? 0)} m',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 7),
          CustomCard(
            height: 40,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            child: Center(
              child: Text(
                value,
                style: textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
