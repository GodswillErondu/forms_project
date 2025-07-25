import 'package:flutter/material.dart';
import 'package:forms_project/infrastructure/form/dtos/form_dto.dart';
import 'package:forms_project/presentation/core/app_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(FormDtoAdapter());
  final formBox = await Hive.openBox<FormDto>('forms_v3');
  getIt.registerSingleton<Box<FormDto>>(formBox);

  configureDependencies();

  runApp(AppWidget());
}


