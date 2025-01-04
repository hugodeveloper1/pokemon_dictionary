import 'package:flutter/material.dart';

class CustomDualView extends StatelessWidget {
  const CustomDualView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.spacing = 20,
  });

  final List items;
  final int crossAxisCount;
  final double spacing;
  final Widget? Function(dynamic) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      padding: EdgeInsets.all(spacing),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      itemBuilder: (c, i) {
        return itemBuilder(items[i]);
      },
    );
  }
}
