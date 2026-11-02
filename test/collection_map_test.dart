import 'package:ecorio/collection_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Mapa inicia em Rio do Sul, seleciona ponto e recentraliza', (
    tester,
  ) async {
    int? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollectionMap(
            selectedPoint: 0,
            onSelectPoint: (value) => selected = value,
            loadTiles: false,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final context = tester.element(find.byType(MarkerLayer));
    final controller = MapController.of(context);
    expect(
      controller.camera.center.latitude,
      closeTo(rioDoSulCenter.latitude, .000001),
    );
    expect(
      controller.camera.center.longitude,
      closeTo(rioDoSulCenter.longitude, .000001),
    );
    await tester.tap(find.byKey(const ValueKey('demo-marker-1')));
    expect(selected, 1);
    await tester.tap(find.byTooltip('Aumentar zoom'));
    await tester.pumpAndSettle();
    expect(controller.camera.zoom, 15);
    await tester.tap(find.byTooltip('Centralizar Rio do Sul'));
    await tester.pumpAndSettle();
    expect(controller.camera.zoom, 14);
    expect(find.text('© OpenStreetMap contributors'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
