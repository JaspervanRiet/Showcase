import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/modules/gallery/gallery.dart';
import 'package:showcase/modules/gallery/gallery_page.dart';

void main() {
  runApp(const ProviderScope(child: ShowcaseApp()));
}

class ShowcaseApp extends ConsumerWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Showcase',
      theme: ref.watch(theme).themeData,
      home: const GalleryPage(),
    );
  }
}
