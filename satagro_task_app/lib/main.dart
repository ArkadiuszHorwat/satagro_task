import 'package:flutter/material.dart';
import 'package:satagro_task_app/app_menu.dart';
import 'package:satagro_task_app/injector.dart';

void main() {
  initDependencies();
  runApp(const AppMenu());
}
