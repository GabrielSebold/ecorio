import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// Geographic center from CISAMAVI's Rio do Sul municipal profile.
const rioDoSulCenter = LatLng(-27.215314, -49.640836);
// Positions exist only to demonstrate marker selection; these are not services.
const demoLocations = [LatLng(-27.2140, -49.6430), LatLng(-27.2180, -49.6360)];

class CollectionMap extends StatefulWidget {
  const CollectionMap({
    super.key,
    required this.selectedPoint,
    required this.onSelectPoint,
    this.loadTiles = true,
  });

  final int selectedPoint;
  final ValueChanged<int> onSelectPoint;
  // Allows deterministic widget tests without requesting remote tiles.
  final bool loadTiles;

  @override
  State<CollectionMap> createState() => _CollectionMapState();
}

class _CollectionMapState extends State<CollectionMap> {
  final controller = MapController();
  bool tileError = false;
  int attempt = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void reportTileError() {
    if (tileError) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !tileError) setState(() => tileError = true);
    });
  }

  Future<void> openAttribution() async {
    final opened = await launchUrl(
      Uri.parse('https://www.openstreetmap.org/copyright'),
      mode: LaunchMode.externalApplication,
    );
    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Créditos: openstreetmap.org/copyright')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: SizedBox(
      height: 270,
      child: Stack(
        children: [
          FlutterMap(
            mapController: controller,
            options: const MapOptions(
              initialCenter: rioDoSulCenter,
              initialZoom: 14,
              minZoom: 10,
              maxZoom: 18,
              interactionOptions: InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              if (widget.loadTiles)
                TileLayer(
                  key: ValueKey(attempt),
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'br.edu.unidavi.ecorio',
                  maxNativeZoom: 19,
                  // No prefetching beyond the visible viewport.
                  panBuffer: 0,
                  keepBuffer: 0,
                  errorTileCallback: (_, _, _) => reportTileError(),
                ),
              MarkerLayer(
                markers: [
                  for (int i = 0; i < demoLocations.length; i++)
                    Marker(
                      point: demoLocations[i],
                      width: 56,
                      height: 56,
                      child: IconButton.filledTonal(
                        key: ValueKey('demo-marker-$i'),
                        tooltip: 'Selecionar ponto ${i + 1} (fictício)',
                        style: IconButton.styleFrom(
                          backgroundColor: widget.selectedPoint == i
                              ? const Color(0xFF17634A)
                              : const Color(0xFFFFE3A7),
                          foregroundColor: widget.selectedPoint == i
                              ? Colors.white
                              : const Color(0xFF553C09),
                        ),
                        onPressed: () => widget.onSelectPoint(i),
                        icon: const Icon(Icons.location_on, size: 30),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const Positioned(
            top: 8,
            left: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('Rio do Sul · SC', style: TextStyle(fontSize: 12)),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Column(
              children: [
                mapButton(Icons.add, 'Aumentar zoom', () {
                  controller.move(
                    controller.camera.center,
                    (controller.camera.zoom + 1).clamp(10.0, 18.0),
                  );
                }),
                const SizedBox(height: 4),
                mapButton(Icons.remove, 'Diminuir zoom', () {
                  controller.move(
                    controller.camera.center,
                    (controller.camera.zoom - 1).clamp(10.0, 18.0),
                  );
                }),
                const SizedBox(height: 4),
                mapButton(
                  Icons.center_focus_strong,
                  'Centralizar Rio do Sul',
                  () => controller.move(rioDoSulCenter, 14),
                ),
              ],
            ),
          ),
          if (tileError)
            Positioned(
              left: 8,
              right: 54,
              bottom: 36,
              child: Material(
                color: const Color(0xFFFFF2D6),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Não foi possível carregar parte do mapa. Confira sua conexão.',
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () => setState(() {
                          tileError = false;
                          attempt++;
                        }),
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: openAttribution,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Text(
                    '© OpenStreetMap contributors',
                    style: TextStyle(fontSize: 11, color: Color(0xFF17634A)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget mapButton(IconData icon, String label, VoidCallback onPressed) =>
      SizedBox(
        width: 36,
        height: 36,
        child: IconButton.filledTonal(
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          tooltip: label,
          onPressed: onPressed,
          icon: Icon(icon, size: 20),
        ),
      );
}
