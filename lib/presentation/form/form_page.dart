import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_project/application/form/form_bloc.dart' as form_bloc;
import 'package:forms_project/injection.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<form_bloc.FormBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Form App'))),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<form_bloc.FormBloc, form_bloc.FormState>(
            builder: (context, state) {

              form_bloc.FormBloc bloc =
              BlocProvider.of<form_bloc.FormBloc>(context);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    onSaved: (text) {
                      bloc.add(form_bloc.FormTextChanged(text ?? ''));
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
