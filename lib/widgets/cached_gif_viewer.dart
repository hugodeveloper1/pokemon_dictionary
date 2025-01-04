import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedGifViewer extends StatelessWidget {
  final String gifUrl;
  final double? height;
  final double? width;

  const CachedGifViewer({
    super.key,
    required this.gifUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: gifUrl,
        fit: BoxFit.cover,
        height: height,
        width: width,
        placeholder: (context, url) {
          return const CircularProgressIndicator();
        },
        errorWidget: (context, url, error) {
          return const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
