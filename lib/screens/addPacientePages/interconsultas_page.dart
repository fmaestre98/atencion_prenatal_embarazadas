// lib/screens/interconsultas_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../core/utils.dart';
import '../../models/interconsultas_model.dart';

class InterconsultasPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  InterconsultasPage({Key? key})
      : super(key: key ?? const ValueKey<String>('InterconsultasPage'));

  void _submitInterconsultas(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<AddPacienteBloc>().add(SubmitInterconsultas());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interconsultas'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccessInterconsultas != current.isSuccessInterconsultas,
        listener: (context, state) {
          if (state.isSuccessInterconsultas) {
            context.pushReplacement(Routes.routeAddResumenAtencion);
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.currentStepInterconsultas !=
                current.currentStepInterconsultas ||
            previous.interconsultasModel != current.interconsultasModel,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
                controller: _scrollController,
                type: StepperType.vertical,
                currentStep: state.currentStepInterconsultas,
                onStepContinue: () {
                  if (state.currentStepInterconsultas < 7) {
                    if (state.currentStepInterconsultas == 0) {
                      scrollToForm(_formKey, _scrollController);
                    } else if (state.currentStepInterconsultas == 1) {
                      scrollToForm(_formKey2, _scrollController);
                    } else if (state.currentStepInterconsultas == 2) {
                      scrollToForm(_formKey3, _scrollController);
                    } else if (state.currentStepInterconsultas == 3) {
                      scrollToForm(_formKey4, _scrollController);
                    } else if (state.currentStepInterconsultas == 4) {
                      scrollToForm(_formKey5, _scrollController);
                    } else if (state.currentStepInterconsultas == 5) {
                      scrollToForm(_formKey6, _scrollController);
                    } else if (state.currentStepInterconsultas == 6) {
                      scrollToForm(_formKey7, _scrollController);
                    }
                    context.read<AddPacienteBloc>().add(
                        UpdateCurrentStepInterconsultas(
                            step: state.currentStepInterconsultas + 1));
                  } else {
                    _submitInterconsultas(context);
                  }
                },
                onStepCancel: () {
                  if (state.currentStepInterconsultas > 0) {
                    context.read<AddPacienteBloc>().add(
                        UpdateCurrentStepInterconsultas(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.interconsultasModel?.psFechaConsulta ==
                                          null
                                      ? 'Fecha de consulta'
                                      : 'Fecha: ${state.interconsultasModel?.psFechaConsulta!.toLocal().toString().split(' ')[0]}',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    selectDateTime(context, (value) {
                                  var interconsulta =
                                      state.interconsultasModel ??
                                          InterconsultasModel();
                                  interconsulta = interconsulta.copyWith(
                                      psFechaConsulta: value);
                                  context
                                      .read<AddPacienteBloc>()
                                      .add(UpdateInterconsultas(
                                        model: interconsulta,
                                      ));
                                }),
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.psEvaluacion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Evaluación'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la evaluación'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(psEvaluacion: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.psCodigo ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Código'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa el código'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(psCodigo: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.psDescripcion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Descripción'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la descripción'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(psDescripcion: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.psEstructura ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Estructura'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la estructura'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(psEstructura: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.psTipoDiagnostico ??
                                    '',
                            decoration: const InputDecoration(
                                labelText: 'Tipo de Diagnóstico'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa el tipo de diagnóstico'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(
                                        psTipoDiagnostico: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.conductaSeguida ??
                                    '',
                            decoration: const InputDecoration(
                                labelText: 'Conducta Seguida'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la conducta seguida'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model:
                                        model.copyWith(conductaSeguida: value),
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state
                                      .interconsultasModel?.nFechaConsulta ==
                                      null
                                      ? 'Fecha de consulta'
                                      : 'Fecha: ${state
                                      .interconsultasModel?.nFechaConsulta!.toLocal().toString().split(' ')[0]}',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    selectDateTime(context, (value) {
                                      var model = state.interconsultasModel ??
                                          InterconsultasModel();
                                      model = model.copyWith(nFechaConsulta: value);
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateInterconsultas(
                                        model:model));
                                    }),
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.nEvaluacion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Evaluación'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la evaluación'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state
                                      .interconsultasModel?.miFechaConsulta ==
                                      null
                                      ? 'Fecha de consulta'
                                      : 'Fecha: ${state
                                      .interconsultasModel?.miFechaConsulta!.toLocal().toString().split(' ')[0]}',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    selectDateTime(context, (value) {
                                      var model = state.interconsultasModel ??
                                          InterconsultasModel(id: 0);
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateInterconsultas(
                                        model:
                                        model.copyWith(miFechaConsulta: value),
                                      ));
                                    }),
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.miEvaluacion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Evaluación'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la evaluación'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state
                                      .interconsultasModel?.tsFechaConsulta ==
                                      null
                                      ? 'Fecha de consulta'
                                      : 'Fecha: ${state
                                      .interconsultasModel?.tsFechaConsulta!.toLocal().toString().split(' ')[0]}',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    selectDateTime(context, (value) {
                                      var model = state.interconsultasModel ??
                                          InterconsultasModel(id: 0);
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateInterconsultas(
                                        model:
                                        model.copyWith(tsFechaConsulta: value),
                                      ));
                                    }),
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.tsEvaluacion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Evaluación'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la evaluación'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state
                                      .interconsultasModel?.dFechaConsulta ==
                                      null
                                      ? 'Fecha de consulta'
                                      : 'Fecha: ${state
                                      .interconsultasModel?.dFechaConsulta!.toLocal().toString().split(' ')[0]}',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    selectDateTime(context, (value) {
                                      var model = state.interconsultasModel ??
                                          InterconsultasModel(id: 0);
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateInterconsultas(
                                        model:
                                        model.copyWith(dFechaConsulta: value),
                                      ));
                                    }),
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.dEvaluacion ?? '',
                            decoration:
                                const InputDecoration(labelText: 'Evaluación'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa la evaluación'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
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
                            initialValue: state.interconsultasModel
                                    ?.examenEstomatologico ??
                                '',
                            decoration: const InputDecoration(
                                labelText: 'Examen Estomatológico'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(
                                        examenEstomatologico: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.numeroExodoncia ??
                                    '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'Número de Exodoncia'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model:
                                        model.copyWith(numeroExodoncia: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue: state
                                    .interconsultasModel?.realizadasExodoncia ??
                                '',
                            decoration: const InputDecoration(
                                labelText: 'Realizadas Exodoncia'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(
                                        realizadasExodoncia: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue: state
                                    .interconsultasModel?.numeroObsturaciones ??
                                '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'Número de Obturaciones'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(
                                        numeroObsturaciones: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue: state.interconsultasModel
                                    ?.realizadasObsturaciones ??
                                '',
                            decoration: const InputDecoration(
                                labelText: 'Realizadas Obturaciones'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(
                                        realizadasObsturaciones: value),
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
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(remitida: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.noAsistencia ?? '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'No. asistencia'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
                                    model: model.copyWith(noAsistencia: value),
                                  ));
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.interconsultasModel?.observaciones ?? '',
                            decoration: const InputDecoration(
                                labelText: 'Observaciones'),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor ingresa este campo'
                                : null,
                            onChanged: (value) {
                              var model = state.interconsultasModel ??
                                  InterconsultasModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateInterconsultas(
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
