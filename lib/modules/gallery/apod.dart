import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/models/apod.dart';

/// Astronomical picture of the day
class Apod extends ConsumerWidget {
  const Apod({
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
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          height: _imageSize,
          width: _imageSize / 2,
          child: Center(
            child: LinearProgressIndicator(
                color: ref.watch(theme).primaryColor,
                backgroundColor: Colors.black,
                value: loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)),
          ),
        );
      },
    );
  }
}
