import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_task_app/features/satellite_map/cubit/satellite_map_cubit.dart';

class SatelliteMapScreen extends StatefulWidget {
  const SatelliteMapScreen({super.key});

  @override
  State<SatelliteMapScreen> createState() => _SatelliteMapScreenState();
}

class _SatelliteMapScreenState extends State<SatelliteMapScreen> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SatelliteMapCubit, SatelliteMapState>(
        builder: (context, state) {
      if (state.userLocation != null) {
        final currentPolygons = getPolygons(context, state);
        return Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(state.userLocation!.latitude,
                    state.userLocation!.longitude),
                zoom: 12,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: state.markers,
              polygons: currentPolygons,
              onTap: (tappedPoint) {
                context
                    .read<SatelliteMapCubit>()
                    .onMapTap(tappedPoint, currentPolygons);
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: FloatingActionButton(
                onPressed: context.read<SatelliteMapCubit>().onClear,
                backgroundColor: Colors.red,
                child: const Icon(Icons.delete_outline),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 90,
              child: FloatingActionButton(
                onPressed: () =>
                    context.read<SatelliteMapCubit>().onSave(currentPolygons),
                backgroundColor: Colors.lightGreen,
                child: const Icon(Icons.check),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 160,
              child: FloatingActionButton(
                onPressed: context.read<SatelliteMapCubit>().onRemoveLast,
                backgroundColor: Colors.lime,
                child: const Icon(Icons.undo),
              ),
            ),
          ],
        );
      }

      return const SizedBox.shrink();
    });
  }

  Set<Polygon> getPolygons(BuildContext context, SatelliteMapState state) {
    final currentPolygons = state.polygons.toList();
    final currentPolygonPoints = state.polygonPoints.toList();

    if (currentPolygons.isEmpty && currentPolygonPoints.isEmpty) {
      return {};
    }

    if (state.saveButtonClicked) {
      return state.polygons;
    }

    if (currentPolygonPoints.length == 1 && state.pointTapped != null) {
      currentPolygons.add(Polygon(
        polygonId: PolygonId('polygon_${state.polygons.length}'),
        points: state.polygonPoints,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.shade300,
        strokeWidth: 3,
      ));
    } else {
      final currentPolygon = currentPolygons.last;

      currentPolygons[currentPolygons
              .indexWhere((element) => element == currentPolygon)] =
          currentPolygon.copyWith(pointsParam: currentPolygonPoints);
    }

    return currentPolygons.toSet();
  }
}
