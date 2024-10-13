import 'package:atencion_prenatal_embarazadas/widgets/add_paciente_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search/search_bloc.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: AddPacienteNavigator(),
    );
  }
}
