import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:showcase/modules/gallery/gallery_card.dart';

import '../../test_utils.dart';

void main() {
  group('GalleryCard', () {
    testGoldens('Verify look', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 0.5)
          ..addScenario('Default', const GalleryCard());
        await tester.pumpWidgetBuilder(
          builder.build(),
          wrapper: widgetTestWrapper(),
        );

        await screenMatchesGolden(tester, 'gallery_card_grid',
            autoHeight: true);
      });
    });
  });
}
