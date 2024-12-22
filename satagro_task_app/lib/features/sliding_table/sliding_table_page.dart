import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_task_app/features/sliding_table/cubit/sliding_table_cubit.dart';
import 'package:satagro_task_app/features/sliding_table/sliding_table_screen.dart';
import 'package:satagro_task_app/injector.dart';
import 'package:satagro_task_app/repositories/sliding_table_repository.dart';

class SlidingTablePage extends StatelessWidget {
  const SlidingTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlidingTableCubit>(
      create: (context) =>
          SlidingTableCubit(getIt.get<ISlidingTableRepository>())..init(),
      child: const SlidingTableScreen(),
    );
  }
}
