// lib/screens/interconsultas_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../models/interconsultas_model.dart';
import 'resumen_atencion_page.dart';

class InterconsultasPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _interconsultasController =
  TextEditingController();
  // Agrega más controladores según tu modelo

  InterconsultasPage({Key? key}) : super(key: key);

  void _submitInterconsultas(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context
          .read<AddPacienteBloc>()
          .add(SubmitInterconsultas());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interconsultas'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccessSignosVitales) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResumenAtencionPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.pacienteLoaded) {
            //_updateControllers(state);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepInterconsultas,
              onStepContinue: () {
                if (state.currentStepInterconsultas < 6) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepInterconsultas(
                      step: state.currentStepInterconsultas + 1));
                } else {
                  _submitInterconsultas(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepInterconsultas > 0) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepInterconsultas(
                      step: state.currentStepInterconsultas - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Psicología'),
                  isActive: state.currentStepInterconsultas >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.psFechaConsulta?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            final fecha = DateTime.tryParse(value);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psFechaConsulta: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.psEvaluacion ?? '',
                          decoration: const InputDecoration(labelText: 'Evaluación'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psEvaluacion: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.psCodigo ?? '',
                          decoration: const InputDecoration(labelText: 'Código'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psCodigo: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.psDescripcion ?? '',
                          decoration: const InputDecoration(labelText: 'Descripción'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psDescripcion: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.psEstructura ?? '',
                          decoration: const InputDecoration(labelText: 'Estructura'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psEstructura: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.psTipoDiagnostico ?? '',
                          decoration: const InputDecoration(labelText: 'Tipo de Diagnóstico'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(psTipoDiagnostico: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.conductaSeguida ?? '',
                          decoration: const InputDecoration(labelText: 'Conducta Seguida'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(conductaSeguida: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Nutrición'),
                  isActive: state.currentStepInterconsultas >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.nFechaConsulta?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            final fecha = DateTime.tryParse(value);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(nFechaConsulta: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.nEvaluacion ?? '',
                          decoration: const InputDecoration(labelText: 'Evaluación'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(nEvaluacion: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Medicina Interna'),
                  isActive: state.currentStepInterconsultas >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.miFechaConsulta?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            final fecha = DateTime.tryParse(value);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(miFechaConsulta: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.miEvaluacion ?? '',
                          decoration: const InputDecoration(labelText: 'Evaluación'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(miEvaluacion: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Trabajo Social'),
                  isActive: state.currentStepInterconsultas >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.tsFechaConsulta?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            final fecha = DateTime.tryParse(value);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(tsFechaConsulta: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.tsEvaluacion ?? '',
                          decoration: const InputDecoration(labelText: 'Evaluación'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(tsEvaluacion: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Defectología'),
                  isActive: state.currentStepInterconsultas >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.dFechaConsulta?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            final fecha = DateTime.tryParse(value);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(dFechaConsulta: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.dEvaluacion ?? '',
                          decoration: const InputDecoration(labelText: 'Evaluación'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(dEvaluacion: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Estomatología'),
                  isActive: state.currentStepInterconsultas >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.interconsultasModel?.examenEstomatologico ?? '',
                          decoration: const InputDecoration(labelText: 'Examen Estomatológico'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(examenEstomatologico: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.numeroExodoncia ?? '',
                          decoration: const InputDecoration(labelText: 'Número de Exodoncia'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(numeroExodoncia: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.realizadasExodoncia ?? '',
                          decoration: const InputDecoration(labelText: 'Realizadas Exodoncia'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(realizadasExodoncia: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.numeroObsturaciones ?? '',
                          decoration: const InputDecoration(labelText: 'Número de Obturaciones'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(numeroObsturaciones: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.realizadasObsturaciones ?? '',
                          decoration: const InputDecoration(labelText: 'Realizadas Obturaciones'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(realizadasObsturaciones: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sicoprofilaxis'),
                  isActive: state.currentStepInterconsultas >= 6,
                  content: Form(
                    key: _formKey7,
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title: const Text('Remitida'),
                          value: state.interconsultasModel?.remitida ?? false,
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(remitida: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.noAsistencia ?? '',
                          decoration: const InputDecoration(labelText: 'No Asistencia'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(noAsistencia: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.interconsultasModel?.observaciones ?? '',
                          decoration: const InputDecoration(labelText: 'Observaciones'),
                          onChanged: (value) {
                            var model = state.interconsultasModel ?? InterconsultasModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateInterconsultas(
                              model: model.copyWith(observaciones: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepInterconsultas >= 7,
                  content: const SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
