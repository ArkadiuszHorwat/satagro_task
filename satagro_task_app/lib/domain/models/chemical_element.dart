import 'package:freezed_annotation/freezed_annotation.dart';

part 'chemical_element.freezed.dart';

@freezed
class ChemicalElement with _$ChemicalElement {
  const factory ChemicalElement({
    required String name,
    required List<double> values,
  }) = _ChemicalElement;
}
