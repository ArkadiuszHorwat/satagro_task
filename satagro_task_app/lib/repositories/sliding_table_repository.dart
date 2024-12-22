import 'dart:math';

import 'package:satagro_task_app/domain/models/chemical_element.dart';

abstract class ISlidingTableRepository {
  List<ChemicalElement> getChemicalElements();
}

class SlidingTableRepository implements ISlidingTableRepository {
  SlidingTableRepository();

  @override
  List<ChemicalElement> getChemicalElements() {
    final result = <ChemicalElement>[];
    final randomValues = <double>[];

    final chemicalElements = [
      'Wodór',
      'Hel',
      'Lit',
      'Beryl',
      'Bor',
      'Węgiel',
      'Azot',
      'Tlen',
    ];

    for (var i = 0; i < 8; i++) {
      randomValues.add(_doubleInRange(i, 8));
    }

    for (var i = 0; i < 8; i++) {
      result.add(
          ChemicalElement(name: chemicalElements[i], value: randomValues[i]));
    }

    return result;
  }

  double _doubleInRange(num start, num end) =>
      Random().nextDouble() * (end - start) + start;
}
