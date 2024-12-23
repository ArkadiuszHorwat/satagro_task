part of 'satellite_map_cubit.dart';

@freezed
class SatelliteMapState with _$SatelliteMapState {
  const factory SatelliteMapState({
    required Set<Marker> markers,
    required Set<Polygon> polygons,
    required List<LatLng> polygonPoints,
    required bool saveButtonClicked,
    Position? userLocation,
    LatLng? pointTapped,
  }) = _SatelliteMapState;

  factory SatelliteMapState.initial() => const SatelliteMapState(
        markers: {},
        polygons: {},
        polygonPoints: [],
        saveButtonClicked: false,
      );
}
