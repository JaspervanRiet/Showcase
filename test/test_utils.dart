import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/services/http_service.dart';

import 'mock_utils.dart';

WidgetWrapper widgetTestWrapper({
  final ShowcaseTheme? showcaseTheme,
  final List<Override>? overrides,
}) {
  return (child) {
    final dio = MockDio();
    when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer(
      (invocation) => Future.value(
        Response(
          requestOptions: RequestOptions(path: 'test'),
          statusCode: 200,
          data: {'title': 'What a nice picture', 'url': 'https://google.com'},
        ),
      ),
    );

    final container = ProviderContainer(
      overrides: overrides ??
          [
            httpServiceProvider.overrideWithValue(dio),
          ],
    );

    if (showcaseTheme != null) {
      container.read(theme.notifier).state = showcaseTheme;
    }

    return UncontrolledProviderScope(
      container: container,
      child: _Wrapper(
        child: child,
      ),
    );
  };
}

class _Wrapper extends ConsumerWidget {
  const _Wrapper({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(theme).themeData,
      debugShowCheckedModeBanner: false,
      home: Material(
        child: child,
      ),
    );
  }
}
