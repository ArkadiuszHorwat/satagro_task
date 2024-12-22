import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_task_app/features/sliding_table/cubit/sliding_table_cubit.dart';

class SlidingTableScreen extends StatelessWidget {
  const SlidingTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingTableCubit, SlidingTableState>(
      builder: (context, state) {
        return Column(
          children: state.chemicalElements
              .map(
                (element) => Row(
                  children: [
                    Text(element.name),
                    Text('${element.value}'),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
