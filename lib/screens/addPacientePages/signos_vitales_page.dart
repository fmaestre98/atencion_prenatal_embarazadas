// lib/screens/signos_vitales_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:atencion_prenatal_embarazadas/router/router.dart';
import 'package:atencion_prenatal_embarazadas/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../core/utils.dart';
import 'examen_fisico_page.dart';

class SignosVitalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  SignosVitalesPage({Key? key})
      : super(key: key ?? const ValueKey<String>('SignosVitalesPage'));

  void _submitSignosVitales(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AddPacienteBloc>().add(SubmitSignosVitales());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signos Vitales/Datos Antropométricos'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccessSignosVitales != current.isSuccessSignosVitales ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.isSuccessSignosVitales) {
            context.pushReplacement(Routes.routeAddExamenFisico);
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.signosVitales != current.signosVitales ||
            current.currentStepSignosVitales !=
                previous.currentStepSignosVitales,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              controller: _scrollController,
              type: StepperType.vertical,
              currentStep: state.currentStepSignosVitales,
              onStepContinue: () {
                if (state.currentStepSignosVitales < 6) {
                  bool update = false;
                  if (state.currentStepSignosVitales == 0) {
                    if (_formKey.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey, _scrollController);
                  } else if (state.currentStepSignosVitales == 1) {
                    if (_formKey2.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey2, _scrollController);
                  } else if (state.currentStepSignosVitales == 2) {
                    if (_formKey3.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey3, _scrollController);
                  } else if (state.currentStepSignosVitales == 3) {
                    if (_formKey4.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey4, _scrollController);
                  } else if (state.currentStepSignosVitales == 4) {
                    if (_formKey5.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey5, _scrollController);
                  } else if (state.currentStepSignosVitales == 5) {
                    if (_formKey6.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey6, _scrollController);
                  }
                  if (update) {
                    context.read<AddPacienteBloc>().add(
                        UpdateCurrentStepSignosVitales(
                            step: state.currentStepSignosVitales + 1));
                  }
                } else {
                  _submitSignosVitales(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepSignosVitales > 0) {
                  context.read<AddPacienteBloc>().add(
                      UpdateCurrentStepSignosVitales(
                          step: state.currentStepSignosVitales - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Datos antropométricos'),
                  isActive: state.currentStepSignosVitales >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue:
                              state.signosVitales?.peso.toString() ?? '',
                          keyboardType: const TextInputType.numberWithOptions(),
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      peso: double.tryParse(value)),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Peso'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el peso'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.talla ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(
                                  UpdateSignosVitales(
                                      signosVitalesModel:
                                          signosVitales.copyWith(talla: value)),
                                );
                          },
                          decoration: const InputDecoration(labelText: 'Talla'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la talla'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.signosVitales?.percentilPeso ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(
                                  UpdateSignosVitales(
                                      signosVitalesModel: signosVitales
                                          .copyWith(percentilPeso: value)),
                                );
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Percentil peso'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el percentil peso'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.signosVitales?.indiceMasaCorporal ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(
                                  UpdateSignosVitales(
                                      signosVitalesModel: signosVitales
                                          .copyWith(indiceMasaCorporal: value)),
                                );
                          },
                          decoration: const InputDecoration(
                              labelText: 'Indice de masa corporal'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el indice de masa corporal';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.signosVitales?.valorNutricional ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(
                                  UpdateSignosVitales(
                                      signosVitalesModel: signosVitales
                                          .copyWith(valorNutricional: value)),
                                );
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Valor nutricional'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el valor nutricional';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state
                                  .signosVitales?.circunsferenciaAbdominal
                                  .toString() ??
                              '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(
                                  UpdateSignosVitales(
                                      signosVitalesModel:
                                          signosVitales.copyWith(
                                              circunsferenciaAbdominal:
                                                  double.tryParse(value))),
                                );
                          },
                          decoration: const InputDecoration(
                              labelText: 'Circunferencia abdominal'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la circunsferencia abdominal'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Tensión Arterial'),
                  isActive: state.currentStepSignosVitales >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.signosVitales?.sistolica ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(sistolica: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Sistólica'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión sistólica'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.diastolica ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(diastolica: value),
                                ));
                          },
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'Diastólica'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión diastólica'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.media ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(media: value),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Media'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión media'
                              : null,
                        ),
                        DropdownButtonFormField<String>(
                          value: state.signosVitales?.postura ?? 'Sentado',
                          decoration:
                              const InputDecoration(labelText: 'Postura'),
                          items: ['Sentado', 'Acostado', 'De pie']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la postura'
                              : null,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(postura: value),
                                ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.signosVitales?.ubicacion ??
                              "Brazo izquierdo",
                          decoration:
                              const InputDecoration(labelText: 'Ubicación'),
                          items: [
                            "Brazo izquierdo",
                            "Brazo derecho",
                            "Miembro inferior izquierdo",
                            "Miembro inferior derecho"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      ubicacion: newValue),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Pulso'),
                  isActive: state.currentStepSignosVitales >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.signosVitales?.valor ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(valor: value),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el valor del pulso'
                              : null,
                        ),
                        DropdownButtonFormField<String>(
                          value:
                              state.signosVitales?.caracteristicas ?? "Normal",
                          decoration: const InputDecoration(
                              labelText: 'Características'),
                          items: [
                            "Normal",
                            "Pulso alternante",
                            "Pulso de latido doble",
                            "Pulso fuerte y saltón",
                            "Pulso paradójico",
                            "Pulso pequeño y débil"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      caracteristicas: newValue),
                                ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.signosVitales?.pulsoUbicacion ??
                              "Pulso carótida",
                          decoration:
                              const InputDecoration(labelText: 'Ubicación'),
                          items: [
                            "Pulso carótida",
                            "Pulso femoral",
                            "Pulso humeral",
                            "Pulso pedio",
                            "Pulso poplíteo",
                            "Pulso radial",
                            "Pulso temporal",
                            "Pulso tibial"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      pulsoUbicacion: newValue),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Frecuencia Respiratoria'),
                  isActive: state.currentStepSignosVitales >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value:
                              state.signosVitales?.frCarateristicas ?? "Apnea",
                          decoration: const InputDecoration(
                              labelText: 'Características'),
                          items: [
                            "Apnea",
                            "Bradipnea",
                            "Disnea",
                            "Eupnea",
                            "Hiperpnea",
                            "Ortopnea",
                            "R. Biot",
                            "R. Cheyne-Stokes",
                            "R. Kussmaul",
                            "Taquipnea"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      frCarateristicas: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.frValor ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(frValor: value),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el valor'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Temperatura'),
                  isActive: state.currentStepSignosVitales >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.signosVitales?.temperatura ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      temperatura: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Temperatura'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la temperatura'
                              : null,
                        ),
                        DropdownButtonFormField<String>(
                          value: state.signosVitales?.localizacion ?? "Oral",
                          decoration: const InputDecoration(
                              labelText: 'Características'),
                          items: [
                            "Oral",
                            "Axilar",
                            "Rectal",
                            "Dérmica",
                            "Ótica"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel: signosVitales.copyWith(
                                      localizacion: newValue),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Frecuencia Cardiaca'),
                  isActive: state.currentStepSignosVitales >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.signosVitales?.fcValor ?? '',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ??
                                SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                  signosVitalesModel:
                                      signosVitales.copyWith(fcValor: value),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el valor'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepSignosVitales >= 6,
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
