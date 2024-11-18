import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/screens/layout_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../router/routes.dart';

class AddPacienteIntermediatePage extends StatelessWidget {

  const AddPacienteIntermediatePage({Key? key})
      : super(key: key ?? const ValueKey<String>('AddPacienteIntermediatePage'));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPacienteBloc, AddPacienteState>(
      listener: (context, state) {
        // Escuchar eventos de estado como eliminación exitosa o errores
        if (state.deleteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Paciente eliminado exitosamente')),
          );
          // Navegar de regreso o a otra página si es necesario
          Navigator.of(context).pop();
        } else if (state.deleteError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Error al eliminar paciente: ${state.deleteError}')),
          );
        }
      },
      builder: (context, state) {
        // Construir la UI dependiendo del estado
        return Scaffold(
          appBar: AppBar(
            title: const Text('Agregar/Editar Paciente'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Mostrar el nombre del paciente si está cargado
                if (state.paciente != null)
                  Column(
                    children: [
                      Text(
                        'Paciente: ${state.paciente!.nombre} ${state.paciente!.primerApellido} ${state.paciente!.segundoApellido}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                     /* ElevatedButton.icon(
                        onPressed: () {
                          // Confirmar eliminación
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Eliminar Paciente'),
                              content: const Text(
                                  '¿Estás seguro de que deseas eliminar este paciente?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Disparar el evento de eliminación
                                    context.read<AddPacienteBloc>().add(
                                          DeletePaciente(
                                              pacienteId: state.paciente!.id),
                                        );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Eliminar',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Eliminar Paciente'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),*/
                    ],
                  ),
                const SizedBox(height: 20),
                // Opciones de navegación
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Datos Personales'),
                        onTap: () {
                          context.push(Routes.routeAddDatosPersonales);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.question_answer),
                        title: const Text('Interrogatorio'),
                        onTap: () {
                          context.push(Routes.routeAddInterrogatorio);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.favorite),
                        title: const Text('Signos Vitales'),
                        onTap: () {
                          context.push(Routes.routeAddSignosVitales);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.medical_services),
                        title: const Text('Examen Físico'),
                        onTap: () {
                          context.push(Routes.routeAddExamenFisico);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.invert_colors_sharp),
                        title: const Text('Genética'),
                        onTap: () {
                          context.push(Routes.routeAddGenetica);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.science),
                        title: const Text('Laboratorio'),
                        onTap: () {
                          context.push(Routes.routeAddLaboratorio);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.interpreter_mode),
                        title: const Text('Interconsultas'),
                        onTap: () {
                          context.push(Routes.routeAddInterconsultas);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.summarize_rounded),
                        title: const Text('Resumen de Atención'),
                        onTap: () {
                          context.push(Routes.routeAddResumenAtencion);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
