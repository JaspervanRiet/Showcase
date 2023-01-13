import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/design/system.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/modules/gallery/space_image.dart';
import 'package:showcase/services/nasa_api_service.dart';

class GalleryCard extends ConsumerWidget {
  const GalleryCard({super.key});

  static const double height = 375;
  static const double width = 400;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = ref.watch(designSystem).padding.medium;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: Card(
          color: ref.watch(theme).cardColor,
          child: Container(
            padding: EdgeInsets.all(padding),
            height: height,
            width: width,
            child: const _Content(),
          ),
        ),
      ),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picture = ref.watch(pictureProvider);
    return picture.when(
      data: (p) => Column(
        children: [
          SpaceImage(picture: p),
          SizedBox(height: ref.watch(designSystem).padding.medium),
          Text(
            p.title,
            style: TextStyle(color: ref.watch(theme).textColor),
          ),
        ],
      ),
      error: (error, stackTrace) {
        return const Text('Error');
      },
      loading: () {
        return Center(
            child: CircularProgressIndicator(
          color: ref.watch(theme).primaryColor,
        ));
      },
    );
  }
}
