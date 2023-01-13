import 'package:flutter_riverpod/flutter_riverpod.dart';

final designSystem =
    NotifierProvider<DesignSystemStore, DesignSystem>(DesignSystemStore.new);

class DesignSystemStore extends Notifier<DesignSystem> {
  @override
  DesignSystem build() {
    return DesignSystem(
      padding: PaddingSystem.phone(),
    );
  }
}

class DesignSystem {
  const DesignSystem({
    required this.padding,
  });

  final PaddingSystem padding;
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
