import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_task_app/main.dart';

part 'satellite_map_cubit.freezed.dart';
part 'satellite_map_state.dart';

class SatelliteMapCubit extends Cubit<SatelliteMapState> {
  SatelliteMapCubit() : super(SatelliteMapState.initial());

  void init() async {
    bool hasPermission = await handlePermission();
    if (!hasPermission) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    emit(state.copyWith(userLocation: position));
  }

  void onMapTap(LatLng tappedPoint, Set<Polygon> currentPolygons) {
    final currentMarkers = state.markers.toList();

    if (state.saveButtonClicked) {
      emit(state.copyWith(saveButtonClicked: false));
    }

    currentMarkers.add(Marker(
      markerId: MarkerId(tappedPoint.toString()),
      position: tappedPoint,
    ));

    emit(
      state.copyWith(
        pointTapped: tappedPoint,
        polygonPoints: [...state.polygonPoints, tappedPoint],
        markers: currentMarkers.toSet(),
        polygons: currentPolygons,
      ),
    );
  }

  void onClear() {
    emit(state.copyWith(
      polygonPoints: [],
      polygons: {},
      markers: {},
      pointTapped: null,
    ));
  }

  void onSave(Set<Polygon> currentPolygons) {
    emit(state.copyWith(
      markers: {},
      polygonPoints: [],
      polygons: currentPolygons,
      saveButtonClicked: true,
      pointTapped: null,
    ));
  }

  void onRemoveLast() {
    if (state.polygonPoints.isNotEmpty) {
      final currentPolygonPoints = state.polygonPoints.toList();
      final currentMarkers = state.markers.toList();
      currentPolygonPoints.removeLast();
      currentMarkers.remove(currentMarkers.last);

      emit(
        state.copyWith(
          polygonPoints: currentPolygonPoints,
          markers: currentMarkers.toSet(),
          pointTapped: null,
        ),
      );
    }
  }
}
