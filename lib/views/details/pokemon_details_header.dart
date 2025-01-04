import 'package:flutter/material.dart';
import 'package:pokemon_dictionary/models/models.dart';

import '../../utils/colors_utils.dart';
import '../../widgets/widgets.dart';

class PokemonDetailsHeader extends StatelessWidget {
  const PokemonDetailsHeader({
    super.key,
    this.pokemon,
  });

  final PokemonModel? pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomPaint(
      painter: BottomCirclePainter(
          color: ColorsUtils.hexToColor(
        (pokemon?.types ?? [])[0].type?.color?.color ?? '',
      )),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          CachedGifViewer(
            gifUrl: pokemon?.urlGif ?? '',
            height: 180,
          ),
          const SizedBox(height: 10),
          Text(
            pokemon?.name ?? '',
            style: textTheme.bodyLarge!,
          ),
          const SizedBox(height: 4),
          Text(
            '#${pokemon?.id ?? '0'}',
            style: textTheme.bodySmall!,
          ),
        ],
      ),
    );
  }
}

class BottomCirclePainter extends CustomPainter {
  final Color color;

  const BottomCirclePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect circleRect = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: size.width / 1.5,
    );

    final Gradient gradient = LinearGradient(
      colors: [
        color,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(circleRect)
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      circleRect,
      0,
      3.14,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
