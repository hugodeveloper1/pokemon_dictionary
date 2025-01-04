import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/models/pokemon_stats_model.dart';

import '../utils/colors_utils.dart';

class PercentageBar extends StatelessWidget {
  final PokemonStatsModel stat;
  final Color? color;
  final double radius;
  final double height;
  final double iv;
  final double level;
  final double natureModifier;

  const PercentageBar({
    super.key,
    required this.stat,
    this.color,
    this.radius = 10,
    this.height = 10,
    this.iv = 31,
    this.level = 100,
    this.natureModifier = 1,
  });

  double
      get calculateStat /* ({
    required double baseStat,
    required int iv,
    required int level,
    required double natureModifier,
    required bool isHP, // true para HP, false para otros stats
  }) */
  {
    // Fórmula para HP
    if ((stat.stat?.name ?? '') == 'hp') {
      return ((stat.baseStat * 2) + iv + (stat.effort / 4)) + 100;
    } else {
      // Fórmula para otros stats
      return (((stat.baseStat * 2) + iv + (stat.effort / 4)) * (level / 100)) *
          natureModifier;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double widthFactor = (stat.baseStat / calculateStat).clamp(0.0, 1.0);

    return Stack(
      children: [
        // Background Bar
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        // Foreground Bar
        FractionallySizedBox(
          widthFactor: widthFactor,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: color ?? ColorsUtils.hexToColor('#2551C3'),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ],
    );
  }
}
