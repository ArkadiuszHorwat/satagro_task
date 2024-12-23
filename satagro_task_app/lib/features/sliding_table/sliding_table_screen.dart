import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
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
            height: 400,
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 800,
              isFixedHeader: true,
              leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
              rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
              itemExtent: 55,
              leftSideItemBuilder: (context, index) => _generateFirstColumnRow(
                  context, index, state.chemicalElements),
              rightSideItemBuilder: (context, index) =>
                  _generateRightHandSideColumnRow(
                      context, index, state.chemicalElements),
              itemCount: state.chemicalElements.length,
              headerWidgets: _getColumns(state.chemicalElements.length),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getColumns(int valuesCount) {
    final columns = <Widget>[];

    for (var i = 0; i <= valuesCount; i++) {
      if (i == 0) {
        columns.add(Container(
          color: Colors.lightGreen,
          width: 100,
          height: 56,
          child: const Text(''),
        ));
      } else {
        columns.add(Container(
          color: Colors.lightGreen,
          width: 100,
          height: 56,
          child: Center(child: Text('$i')),
        ));
      }
    }

    return columns;
  }

  Widget _generateFirstColumnRow(
      BuildContext context, int index, List<ChemicalElement> chemicalElements) {
    return Container(
      width: 100,
      height: 52,
      color: Colors.lime,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Center(child: RowSortCell(element: chemicalElements[index])),
    );
  }

  Widget _generateRightHandSideColumnRow(
      BuildContext context, int index, List<ChemicalElement> chemicalElements) {
    final cells = <Widget>[];
    for (var elementValue in chemicalElements[index].values) {
      cells.add(SizedBox(
          width: 100, height: 52, child: Center(child: Text('$elementValue'))));
    }

    return Row(children: cells);
  }
}
