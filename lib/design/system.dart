import 'package:flutter_riverpod/flutter_riverpod.dart';

final designSystem =
    NotifierProvider<DesignSystemStore, DesignSystem>(DesignSystemStore.new);

class DesignSystemStore extends Notifier<DesignSystem> {
  @override
  DesignSystem build() {
    return DesignSystem();
  }
}

class DesignSystem {
  PaddingSystem get padding => PaddingSystem.phone();
}

class PaddingSystem {
  PaddingSystem({
    required this.medium,
  });

  factory PaddingSystem.phone() {
    return PaddingSystem(medium: 16);
  }

  final double medium;
}
