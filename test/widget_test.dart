import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:showcase/main.dart';
import 'package:showcase/services/http_service.dart';

import 'mock_utils.dart';

void main() {
  group('App', () {
    late Dio dio;

    setUp(() {
      dio = MockDio();
    });

    testWidgets('Launches', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [httpServiceProvider.overrideWithValue(dio)],
        child: const ShowcaseApp(),
      ));
    });
  });
}
