import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';

class ResumenAtencionPage extends StatelessWidget {
  ResumenAtencionPage({Key? key}) : super(key: key);

  void _guardarPaciente(BuildContext context) {
    // Enviar evento para guardar en la base de datos
    context.read<AddPacienteBloc>().add(SubmitPaciente());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de la Atención'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Embarazada agregada exitosamente')),
            );
            // Navegar de vuelta al inicio o a donde desees
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          }
        },
        builder: (context, state) {
          if (state.isSubmitting) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Datos Personales
                Text('Datos Personales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    'Nombre: ${state.paciente?.nombre} ${state.paciente?.primerApellido} ${state.paciente?.segundoApellido}'),
                Text(
                    'Fecha de Nacimiento: ${state.paciente?.fechaNacimiento?.toLocal()}'.split(' ')[0]),
                Text('Sexo: ${state.paciente?.sexo}'),
                Text('Dirección: ${state.paciente?.direccion}'),
                Text('No. Identidad: ${state.paciente?.noIdentidad}'),
                Text('ABO Rh: ${state.paciente?.aboRh}'),
                Text('Unidad Hospitalaria: ${state.paciente?.unidadHospitalaria}'),
                Text('Policlinico: ${state.paciente?.policlinico}'),
                Text('Estado Civil: ${state.paciente?.estadoCivil}'),
                Text('Escolaridad: ${state.paciente?.escolaridad}'),
                Text('Consultorio: ${state.paciente?.consultorio}'),
                Text('Ocupación: ${state.paciente?.ocupacion}'),
                Text('No. Dormitorios: ${state.paciente?.noDormitorios}'),
                Text('No. Personas en Núcleo Personal: ${state.paciente?.noPersonasNucleoPersonal}'),
                Text('Tipo de Riesgo: ${state.paciente?.tipoDeRiesgo}'),
                Text('Datos de Interés: ${state.paciente?.datosDeInteres}'),
                Text('Tipo de Diagnóstico: ${state.paciente?.tipoDeDiagnostico}'),
                Text('Descripción: ${state.paciente?.descripcion}'),
                Text('Estructura: ${state.paciente?.estructura}'),
                Text('Conducta Seguidora: ${state.paciente?.conductaSeguida}'),

                SizedBox(height: 16),
                // Interrogatorio
                Text('Interrogatorio',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                if (state.interrogatorio != null) ...[
                  // Muestra los datos del interrogatorio
                /*  Text('Antecedentes Médicos: ${state.interrogatorio!.antecedentesMedicos}'),
                  Text(
                      'Antecedentes Familiares: ${state.interrogatorio!.antecedentesFamiliares}'),
                  Text('Hábitos: ${state.interrogatorio!.habitos}'),*/
                  // Agrega más datos del interrogatorio...
                ] else
                  Text('No se ha completado el interrogatorio'),

                // Agrega resúmenes de otras secciones...

                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => _guardarPaciente(context),
                  child: Text('Guardar y Finalizar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
