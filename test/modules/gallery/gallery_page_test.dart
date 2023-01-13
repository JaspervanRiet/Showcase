import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:showcase/design/theme.dart';
import 'package:showcase/modules/gallery/gallery_page.dart';
import 'package:showcase/services/http_service.dart';

import '../../mock_utils.dart';
import '../../test_utils.dart';

void main() {
  group('GalleryPage', () {
    testGoldens('Verify light theme', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const GalleryPage(),
          );
        await tester.pumpDeviceBuilder(builder, wrapper: widgetTestWrapper());
        await screenMatchesGolden(tester, 'gallery_page_light_theme');
      });
    });

    testGoldens('Verify dark theme', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'Dark theme',
            widget: const GalleryPage(),
          );

        await tester.pumpDeviceBuilder(builder,
            wrapper: widgetTestWrapper(showcaseTheme: ShowcaseTheme.dark()));
        await screenMatchesGolden(tester, 'gallery_page_dark_theme');
      });
    });

    testGoldens('Verify error handling', (tester) async {
      final dio = MockDio();
      when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (invocation) => Future.value(
          Response(
            requestOptions: RequestOptions(path: 'test'),
            statusCode: 401,
            data: {},
          ),
        ),
      );

      await mockNetworkImagesFor(() async {
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const GalleryPage(),
          );
        await tester.pumpDeviceBuilder(builder,
            wrapper: widgetTestWrapper(
                overrides: [httpServiceProvider.overrideWithValue(dio)]));
        await screenMatchesGolden(tester, 'gallery_page_error');
      });
    });

    testGoldens('Verify theme switching', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [Device.phone])
          ..addScenario(
            name: 'After button press',
            widget: const GalleryPage(),
            onCreate: (key) async {
              await tester.tap(find.descendant(
                  of: find.byKey(key), matching: find.byType(ElevatedButton)));
              await tester.pumpAndSettle();
            },
          );

        await tester.pumpDeviceBuilder(builder, wrapper: widgetTestWrapper());
        await screenMatchesGolden(tester, 'gallery_page_theme_switching');
      });
    });
  });
}
