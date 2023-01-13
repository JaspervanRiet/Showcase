import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/design/system.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/modules/gallery/apod_card.dart';
import 'package:showcase/services/nasa_api_service.dart';

class GalleryCard extends ConsumerWidget {
  const GalleryCard({super.key});

  static const double height = 375;
  static const double width = 400;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picture = ref.watch(pictureProvider);

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
            child: picture.when(
              data: (p) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Apod(picture: p),
                  SizedBox(height: padding),
                  Text(
                    p.title,
                    style: TextStyle(color: ref.watch(theme).textColor),
                  ),
                ],
              ),
              error: (error, stackTrace) {
                print(error);
                print(stackTrace);
                return Text('Error');
              },
              loading: () {
                return Center(
                    child: CircularProgressIndicator(
                  color: ref.watch(theme).primaryColor,
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
