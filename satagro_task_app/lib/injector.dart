import 'package:get_it/get_it.dart';
import 'package:satagro_task_app/repositories/sliding_table_repository.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<ISlidingTableRepository>(SlidingTableRepository());
}
