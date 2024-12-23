import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_task_app/domain/models/chemical_element.dart';
import 'package:satagro_task_app/features/sliding_table/cubit/sliding_table_cubit.dart';

enum RowSortCellType { asc, dsc, normal }

class RowSortCell extends StatefulWidget {
  const RowSortCell({
    required this.element,
    super.key,
  });

  final ChemicalElement element;

  @override
  State<RowSortCell> createState() => _RowSortCellState();
}

class _RowSortCellState extends State<RowSortCell> {
  late RowSortCellType cellType;
  @override
  void initState() {
    cellType = RowSortCellType.normal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => switch (cellType) {
              RowSortCellType.normal => cellType = RowSortCellType.dsc,
              RowSortCellType.dsc => cellType = RowSortCellType.asc,
              RowSortCellType.asc => cellType = RowSortCellType.normal,
            });
        context
            .read<SlidingTableCubit>()
            .onSorted(chemicalElement: widget.element, sortType: cellType);
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.lime,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.element.name),
            const SizedBox(width: 8),
            switch (cellType) {
              RowSortCellType.asc => const Icon(Icons.arrow_upward),
              RowSortCellType.dsc => const Icon(Icons.arrow_downward),
              RowSortCellType.normal => const Icon(Icons.sort),
            },
          ],
        ),
      ),
    );
  }
}
