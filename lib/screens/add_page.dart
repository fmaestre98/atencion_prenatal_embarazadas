import 'package:atencion_prenatal_embarazadas/bloc/add/add_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/add_paciente_intermediate_page.dart';
import 'package:atencion_prenatal_embarazadas/widgets/add_paciente_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  final int? pacienteId;

  // Constructor que acepta un pacienteId
  const AddPage({Key? key, this.pacienteId})
      : super(key: key ?? const ValueKey<String>('AddPage'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddPacienteBloc()..add(LoadPacienteData(pacienteId: pacienteId)),
      child: const AddPacienteIntermediatePage(),
    );
  }
}
