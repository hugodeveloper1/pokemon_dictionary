import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.backgroundColor,
    this.child,
    this.padding,
    this.margin,
    this.borderRadius = 9,
    this.border,
    this.isShadow = false,
    this.radius,
    this.colors = const [],
    this.isSplashColor = true,
  });

  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Border? border;
  final bool isShadow;
  final BorderRadius? radius;
  final bool isSplashColor;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius ?? BorderRadius.circular(borderRadius),
        border: border,
        /* gradient: LinearGradient(
          colors: colors.isEmpty ? [Colors.white] : colors,
          begin: Alignment.topCenter, // Desde la parte superior
          end: Alignment.bottomCenter, // Hasta la parte inferior
        ), */
        boxShadow: isShadow
            ? [
                const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 6.0,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 0,
                  offset: Offset(0, 0.5),
                ),
              ]
            : [],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        highlightColor:
            isSplashColor ? Colors.grey.shade100 : Colors.transparent,
        focusColor: isSplashColor ? Colors.grey.shade100 : Colors.transparent,
        splashColor: isSplashColor ? Colors.grey.shade100 : Colors.transparent,
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
