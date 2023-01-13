import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/modules/gallery/gallery.dart';

class GalleryPage extends ConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(theme).backgroundColor,
      body: const SafeArea(
        child: GalleryCard(),
      ),
    );
  }
}
