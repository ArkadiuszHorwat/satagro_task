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

    for (var element in chemicalElements) {
      final randomValues = <double>[];
      for (var i = 0; i < 8; i++) {
        randomValues.add(_doubleInRange(i, 8));
      }

      result.add(ChemicalElement(name: element, values: randomValues));
    }

    return result;
  }

  double _doubleInRange(num start, num end) => num.parse(
          (Random().nextDouble() * (end - start) + start).toStringAsFixed(3))
      .toDouble();
}
