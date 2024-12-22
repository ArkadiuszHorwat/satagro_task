import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:satagro_task_app/domain/models/chemical_element.dart';
import 'package:satagro_task_app/repositories/sliding_table_repository.dart';

part 'sliding_table_cubit.freezed.dart';
part 'sliding_table_state.dart';

class SlidingTableCubit extends Cubit<SlidingTableState> {
  SlidingTableCubit(this._slidingTableRepository)
      : super(SlidingTableState.initial());

  final ISlidingTableRepository _slidingTableRepository;

  void init() {
    final chemicalElements = _slidingTableRepository.getChemicalElements();

    emit(state.copyWith(chemicalElements: chemicalElements));
  }
}
