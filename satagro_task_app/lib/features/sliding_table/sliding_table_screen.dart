import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_task_app/domain/models/chemical_element.dart';
import 'package:satagro_task_app/features/sliding_table/cubit/sliding_table_cubit.dart';
import 'package:satagro_task_app/features/widgets/row_sort_cell.dart';

class SlidingTableScreen extends StatelessWidget {
  const SlidingTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingTableCubit, SlidingTableState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            height: 300,
            child: DataTable2(
              minWidth: 1000,
              fixedLeftColumns: 1,
              horizontalMargin: 0,
              isVerticalScrollBarVisible: true,
              isHorizontalScrollBarVisible: true,
              headingRowColor:
                  WidgetStateColor.resolveWith((state) => Colors.lightGreen),
              columns: _getColumns(state.chemicalElements.first.values.length),
              rows: _getRows(context, state.chemicalElements),
            ),
          ),
        );
      },
    );
  }

  List<DataColumn> _getColumns(int valuesCount) {
    final columns = <DataColumn2>[];

    for (var i = 0; i <= valuesCount; i++) {
      if (i == 0) {
        columns.add(const DataColumn2(label: Text('')));
      } else {
        columns.add(
          DataColumn2(
            label: Text('$i'),
            headingRowAlignment: MainAxisAlignment.center,
          ),
        );
      }
    }

    return columns;
  }

  List<DataRow> _getRows(
      BuildContext context, List<ChemicalElement> chemicalElements) {
    final rows = <DataRow2>[];

    for (var element in chemicalElements) {
      final cells = [
        DataCell(RowSortCell(element: element)),
      ];

      for (var elementValue in element.values) {
        cells.add(DataCell(Center(child: Text('$elementValue'))));
      }

      rows.add(DataRow2(cells: cells));
    }

    return rows;
  }
}
