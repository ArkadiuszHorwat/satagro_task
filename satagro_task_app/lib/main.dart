import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:satagro_task_app/app_menu.dart';
import 'package:satagro_task_app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await handlePermission();
  runApp(const AppMenu());
}

Future<bool> handlePermission() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return false;
  }

  return true;
}
