// lib/screens/laboratorio_page.dart
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import '../../core/utils.dart';

class LaboratorioPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();
  final _formKey9 = GlobalKey<FormState>();
  final _formKey10 = GlobalKey<FormState>();
  final _formKey11 = GlobalKey<FormState>();
  final _formKey12 = GlobalKey<FormState>();
  final _formKey13 = GlobalKey<FormState>();
  final _formKey14 = GlobalKey<FormState>();
  final _formKey15 = GlobalKey<FormState>();
  final _formKey16 = GlobalKey<FormState>();
  final _formKey17 = GlobalKey<FormState>();
  final _formKey18 = GlobalKey<FormState>();
  final _formKey19 = GlobalKey<FormState>();
  final _formKey20 = GlobalKey<FormState>();
  final _formKey21 = GlobalKey<FormState>();
  final _formKey22 = GlobalKey<FormState>();
  final _formKey23 = GlobalKey<FormState>();
  final _formKey24 = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  
  // Agrega más controladores según tu modelo

  LaboratorioPage({Key? key}) : super(key: key);

  void _submitLaboratorio(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AddPacienteBloc>().add(SubmitLaboratorio());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratorio y Microbiología'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccessLaboratorio != current.isSuccessLaboratorio,
        listener: (context, state) {
          if (state.isSuccessLaboratorio) {
            context.pushReplacement(Routes.routeAddInterconsultas);
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.pacienteLoaded) {
            //_updateControllers(state);
          }
        },
        buildWhen: (previous, current) =>
            previous.laboratorioMicrobiologiaModel !=
                current.laboratorioMicrobiologiaModel ||
            previous.currentStepLaboratorio != current.currentStepLaboratorio,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepLaboratorio,
              onStepContinue: () {
                bool update = false;
                if (state.currentStepLaboratorio < 24) {
                  if (state.currentStepLaboratorio == 0) {
                    if (_formKey.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey, _scrollController);
                  } else if (state.currentStepLaboratorio == 1) {
                    if (_formKey2.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey2, _scrollController);
                  } else if (state.currentStepLaboratorio == 2) {
                    if (_formKey3.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey3, _scrollController);
                  } else if (state.currentStepLaboratorio == 3) {
                    if (_formKey4.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey4, _scrollController);
                  } else if (state.currentStepLaboratorio == 4) {
                    if (_formKey5.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey5, _scrollController);
                  } else if (state.currentStepLaboratorio == 5) {
                    if (_formKey6.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey6, _scrollController);
                  } else if (state.currentStepLaboratorio == 6) {
                    if (_formKey7.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey7, _scrollController);
                  } else if (state.currentStepLaboratorio == 7) {
                    if (_formKey8.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey8, _scrollController);
                  } else if (state.currentStepLaboratorio == 8) {
                    if (_formKey9.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey9, _scrollController);
                  } else if (state.currentStepLaboratorio == 9) {
                    if (_formKey10.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey10, _scrollController);
                  } else if (state.currentStepLaboratorio == 10) {
                    if (_formKey11.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey11, _scrollController);
                  } else if (state.currentStepLaboratorio == 11) {
                    if (_formKey12.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey12, _scrollController);
                  } else if (state.currentStepLaboratorio == 12) {
                    if (_formKey13.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey13, _scrollController);
                  } else if (state.currentStepLaboratorio == 13) {
                    if (_formKey14.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey14, _scrollController);
                  } else if (state.currentStepLaboratorio == 14) {
                    if (_formKey15.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey15, _scrollController);
                  } else if (state.currentStepLaboratorio == 15) {
                    if (_formKey16.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey16, _scrollController);
                  } else if (state.currentStepLaboratorio == 16) {
                    if (_formKey17.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey17, _scrollController);
                  } else if (state.currentStepLaboratorio == 17) {
                    if (_formKey18.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey18, _scrollController);
                  } else if (state.currentStepLaboratorio == 18) {
                    if (_formKey19.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey19, _scrollController);
                  } else if (state.currentStepLaboratorio == 19) {
                    if (_formKey20.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey20, _scrollController);
                  } else if (state.currentStepLaboratorio == 20) {
                    if (_formKey21.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey21, _scrollController);
                  } else if (state.currentStepLaboratorio == 21) {
                    if (_formKey22.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey22, _scrollController);
                  } else if (state.currentStepLaboratorio == 22) {
                    if (_formKey23.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey23, _scrollController);
                  } else if (state.currentStepLaboratorio == 23) {
                    if (_formKey24.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey24, _scrollController);
                  }
                  if(update){
                    context.read<AddPacienteBloc>().add(
                        UpdateCurrentStepLaboratorio(
                            step: state.currentStepLaboratorio + 1)); 
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Revise los datos ingresados")),
                    );
                  }
                } else {
                  _submitLaboratorio(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepLaboratorio > 0) {
                  context.read<AddPacienteBloc>().add(
                      UpdateCurrentStepLaboratorio(
                          step: state.currentStepLaboratorio - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Grupo y factor'),
                  isActive: state.currentStepLaboratorio >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.ghResultadoMaterno ?? "O+",
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno'),
                          items: [
                        "O+","O-", "A+","A-","B+","B-", "AB+","AB-"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  ghResultadoMaterno: newValue),
                            ));

                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.grFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.grFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          grFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.ghResultadoPaterno ?? "O+",
                          decoration: const InputDecoration(
                              labelText: 'Resultado paterno'),
                          items: [
                            "O+","O-", "A+","A-","B+","B-", "AB+","AB-"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  ghResultadoPaterno: newValue),
                            ));

                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.grFechaRealizacionPaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.grFechaRealizacionPaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          grFechaRealizacionPaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('VIH'),
                  isActive: state.currentStepLaboratorio >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.vihResultadoMaterno ?? "Negativo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno'),
                          items: [
                            "Positivo", "Negativo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  vihResultadoMaterno: newValue),
                            ));

                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.vihFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.vihFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          vihFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.vihResultadoPaterno ?? "Negativo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado paterno'),
                          items: [
                            "Positivo", "Negativo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  vihResultadoPaterno: newValue),
                            ));

                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.vihFechaRealizacionPaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.vihFechaRealizacionPaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          vihFechaRealizacionPaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Serología'),
                  isActive: state.currentStepLaboratorio >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.sResultadoMaterno ?? "No reactivo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno'),
                          items: [
                            "No reactivo", "Reactivo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  sResultadoMaterno: newValue),
                            ));

                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.sFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.sFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          sFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.sResultadoPaterno ?? "No reactivo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado paterno'),
                          items: [
                            "No reactivo", "Reactivo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  sResultadoPaterno: newValue),
                            ));
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.sFechaRealizacionPaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.sFechaRealizacionPaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          sFechaRealizacionPaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Antígeno de superficie'),
                  isActive: state.currentStepLaboratorio >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.asResultadoMaterno ?? "No reactivo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Antígeno de superficie'),
                          items: [
                            "No reactivo", "Reactivo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  asResultadoMaterno: newValue),
                            ));
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.asFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.asFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          asFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: state.laboratorioMicrobiologiaModel
                              ?.asResultadoPaterno ?? "No reactivo",
                          decoration: const InputDecoration(
                              labelText: 'Resultado paterno Antígeno de superficie'),
                          items: [
                            "No reactivo", "Reactivo"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                              model: laboratorio.copyWith(
                                  asResultadoPaterno: newValue),
                            ));
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.asFechaRealizacionPaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.asFechaRealizacionPaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          asFechaRealizacionPaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Hemoglobina (Hb)'),
                  isActive: state.currentStepLaboratorio >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.hbResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      hbResultadoMaterno: value),
                                ));
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Hb'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Hb'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.hbFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.hbFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          hbFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Hematocrito (Hto)'),
                  isActive: state.currentStepLaboratorio >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.htoResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      htoResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Hto'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Hto'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.htoFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.htoFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          htoFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Glicemia'),
                  isActive: state.currentStepLaboratorio >= 6,
                  content: Form(
                    key: _formKey7,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.gResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      gResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Glicemia'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Glicemia'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.gFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.gFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          gFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('PTG Ayunas'),
                  isActive: state.currentStepLaboratorio >= 7,
                  content: Form(
                    key: _formKey8,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.ptgaResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      ptgaResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno PTG Ayunas'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno PTG Ayunas'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.ptgaFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.ptgaFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          ptgaFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('PTG dos horas después'),
                  isActive: state.currentStepLaboratorio >= 8,
                  content: Form(
                    key: _formKey9,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.ptg2hResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      ptg2hResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno PTG 2 Horas'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno PTG 2 Horas'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.ptg2hFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.ptg2hFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          ptg2hFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Creatinina'),
                  isActive: state.currentStepLaboratorio >= 9,
                  content: Form(
                    key: _formKey10,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.cResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      cResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Creatinina'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Creatinina'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.cFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.cFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          cFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Ácido úrico'),
                  isActive: state.currentStepLaboratorio >= 10,
                  content: Form(
                    key: _formKey11,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.auResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      auResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Ácido Úrico'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Ácido Úrico'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.auFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.auFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          auFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Urea'),
                  isActive: state.currentStepLaboratorio >= 11,
                  content: Form(
                    key: _formKey12,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.uResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      uResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Urea'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Urea'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.uFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.uFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          uFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Colesterol'),
                  isActive: state.currentStepLaboratorio >= 12,
                  content: Form(
                    key: _formKey13,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.colResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      colResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Colesterol'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Colesterol'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.colFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.colFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          colFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Triglicéridos'),
                  isActive: state.currentStepLaboratorio >= 13,
                  content: Form(
                    key: _formKey14,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.tResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      tResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Triglicéridos'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Triglicéridos'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.tFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.tFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          tFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Bilirrubina'),
                  isActive: state.currentStepLaboratorio >= 14,
                  content: Form(
                    key: _formKey15,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.bResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      bResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Bilirrubina'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Bilirrubina'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.bFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.bFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          bFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('TPG'),
                  isActive: state.currentStepLaboratorio >= 15,
                  content: Form(
                    key: _formKey16,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.tpgResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      tpgResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno TPG'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno TPG'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.tpgFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.tpgFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          tpgFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('TGO'),
                  isActive: state.currentStepLaboratorio >= 16,
                  content: Form(
                    key: _formKey17,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.tgoResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      tgoResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno TGO'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno TGO'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.tgoFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.tgoFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          tgoFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('GGT'),
                  isActive: state.currentStepLaboratorio >= 17,
                  content: Form(
                    key: _formKey18,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.ggtResultadoMaterno ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      ggtResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno GGT'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno GGT'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.ggtFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.ggtFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          ggtFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cituria'),
                  isActive: state.currentStepLaboratorio >= 18,
                  content: Form(
                    key: _formKey19,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.citResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      citResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.citFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.citFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          citFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Urocultivo'),
                  isActive: state.currentStepLaboratorio >= 19,
                  content: Form(
                    key: _formKey20,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.uroResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      uroResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Urocultivo'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Urocultivo'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.uroFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.uroFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          uroFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Heces fecales'),
                  isActive: state.currentStepLaboratorio >= 20,
                  content: Form(
                    key: _formKey21,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.hfResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      hfResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Heces fecales'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Heces fecales'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.hfFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.hfFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          hfFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Exudado vaginal simple'),
                  isActive: state.currentStepLaboratorio >= 21,
                  content: Form(
                    key: _formKey22,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.evsResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      evsResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText:
                                  'Resultado materno Exudado vaginal simple'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Exudado vaginal simple'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.evsFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.evsFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          evsFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Exudado vaginal cultivo'),
                  isActive: state.currentStepLaboratorio >= 22,
                  content: Form(
                    key: _formKey23,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.evcResultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      evcResultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText:
                                  'Resultado materno Exudado vaginal cultivo'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Exudado vaginal cultivo'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.evcFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.evcFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          evcFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Prueba de coombs'),
                  isActive: state.currentStepLaboratorio >= 23,
                  content: Form(
                    key: _formKey24,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.laboratorioMicrobiologiaModel
                                  ?.pcsultadoMaterno ??
                              '',
                          onChanged: (value) {
                            var laboratorio =
                                state.laboratorioMicrobiologiaModel ??
                                    LaboratorioMicrobiologiaModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateLaboratorio(
                                  model: laboratorio.copyWith(
                                      pcsultadoMaterno: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Resultado materno Prueba de Coombs'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el resultado materno Prueba de Coombs'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.laboratorioMicrobiologiaModel
                                            ?.pcFechaRealizacionMaterno ==
                                        null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.laboratorioMicrobiologiaModel?.pcFechaRealizacionMaterno!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  selectDateTime(context, (value) {
                                var laboratorio =
                                    state.laboratorioMicrobiologiaModel ??
                                        LaboratorioMicrobiologiaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateLaboratorio(
                                      model: laboratorio.copyWith(
                                          pcFechaRealizacionMaterno: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepLaboratorio >= 24,
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
