import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_project/application/form/form_bloc.dart';
import 'package:forms_project/injection.dart';
import 'package:forms_project/presentation/form/form_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => getIt<FormBloc>(),
      child: FormPage(),),
    );
  }
}
