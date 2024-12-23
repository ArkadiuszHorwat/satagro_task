import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_task_app/features/satellite_map/cubit/satellite_map_cubit.dart';
import 'package:satagro_task_app/features/satellite_map/satellite_map_screen.dart';

class SatelliteMapPage extends StatelessWidget {
  const SatelliteMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SatelliteMapCubit>(
      create: (context) => SatelliteMapCubit()..init(),
      child: const SatelliteMapScreen(),
    );
  }
}
