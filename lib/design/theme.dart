import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme =
    NotifierProvider<ShowcaseThemeStore, ShowcaseTheme>(ShowcaseThemeStore.new);

class ShowcaseThemeStore extends Notifier<ShowcaseTheme> {
  @override
  build() {
    return ShowcaseTheme.light();
  }

  void switchTheme() {
    if (state.type == ThemeType.light) {
      state = ShowcaseTheme.dark();
    } else {
      state = ShowcaseTheme.light();
    }
  }
}

class ShowcaseTheme {
  ShowcaseTheme({
    required this.type,
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.textColor,
  });

  factory ShowcaseTheme.light() {
    return ShowcaseTheme(
      type: ThemeType.light,
      primaryColor: Colors.blue,
      backgroundColor: const Color(0xFFEEEFFF),
      cardColor: Colors.white,
      textColor: Colors.black,
    );
  }

  factory ShowcaseTheme.dark() {
    return ShowcaseTheme(
      type: ThemeType.dark,
      primaryColor: Colors.blue,
      backgroundColor: Colors.black,
      cardColor: const Color.fromARGB(255, 26, 26, 26),
      textColor: Colors.white,
    );
  }

  final ThemeType type;
  final MaterialColor primaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color textColor;

  ThemeData get themeData {
    return ThemeData(
      primarySwatch: primaryColor,
    );
  }
}

enum ThemeType { light, dark }
