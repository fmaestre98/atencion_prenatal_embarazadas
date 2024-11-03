import 'package:get_it/get_it.dart';
import 'package:atencion_prenatal_embarazadas/data/database/objectbox.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final objectBoxService = await ObjectBox.create();
  getIt.registerSingleton<ObjectBox>(objectBoxService);
}

Future<void> setupTestLocator(ObjectBox mockObjectbox) async {
  getIt.registerSingleton<ObjectBox>(mockObjectbox);
}