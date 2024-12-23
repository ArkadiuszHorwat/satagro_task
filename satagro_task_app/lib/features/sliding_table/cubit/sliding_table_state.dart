part of 'sliding_table_cubit.dart';

@freezed
class SlidingTableState with _$SlidingTableState {
  const factory SlidingTableState({
    required List<ChemicalElement> chemicalElements,
    required List<ChemicalElement> chemicalElementsNotSorted,
  }) = _SlidingTableState;

  factory SlidingTableState.initial() => const SlidingTableState(
        chemicalElements: [],
        chemicalElementsNotSorted: [],
      );
}
