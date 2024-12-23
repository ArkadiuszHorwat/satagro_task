import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:satagro_task_app/domain/models/chemical_element.dart';
import 'package:satagro_task_app/features/widgets/row_sort_cell.dart';
import 'package:satagro_task_app/repositories/sliding_table_repository.dart';

part 'sliding_table_cubit.freezed.dart';
part 'sliding_table_state.dart';

class SlidingTableCubit extends Cubit<SlidingTableState> {
  SlidingTableCubit(this._slidingTableRepository)
      : super(SlidingTableState.initial());

  final ISlidingTableRepository _slidingTableRepository;

  void init() {
    final chemicalElements = _slidingTableRepository.getChemicalElements();

    emit(state.copyWith(
      chemicalElements: chemicalElements,
      chemicalElementsNotSorted: chemicalElements,
    ));
  }

  void onSorted({
    required ChemicalElement chemicalElement,
    required RowSortCellType sortType,
  }) {
    final currentList = state.chemicalElements.toList();

    final sortedElement =
        currentList.firstWhere((element) => element == chemicalElement);

    final sortedValues = sortedElement.values.toList();

    switch (sortType) {
      case RowSortCellType.normal:
        {
          emit(state.copyWith(
              chemicalElements: state.chemicalElementsNotSorted));
          return;
        }
      case RowSortCellType.dsc:
        sortedValues.sort(
            (firstValue, secondValue) => secondValue.compareTo(firstValue));
      case RowSortCellType.asc:
        sortedValues.sort(
            (firstValue, secondValue) => firstValue.compareTo(secondValue));
    }

    currentList[
            currentList.indexWhere((element) => element == chemicalElement)] =
        sortedElement.copyWith(values: sortedValues);

    emit(state.copyWith(chemicalElements: currentList));
  }
}
