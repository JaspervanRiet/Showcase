import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/models/apod.dart';

/// Astronomical picture of the day
class SpaceImage extends ConsumerWidget {
  const SpaceImage({
    required this.picture,
    super.key,
  });

  final Picture picture;

  static const double _imageSize = 300;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.network(
      picture.url,
      height: _imageSize,
      width: _imageSize,
      cacheHeight: _imageSize.toInt(),
      cacheWidth: _imageSize.toInt(),
    );
  }
}
