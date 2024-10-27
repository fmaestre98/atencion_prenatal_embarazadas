// lib/screens/signos_vitales_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import 'examen_fisico_page.dart';

class SignosVitalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();


  SignosVitalesPage({Key? key}) : super(key: key);


  void _submitSignosVitales(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate()) {
      _formKey.currentState!.save();
      context
          .read<AddPacienteBloc>()
          .add(SubmitSignosVitales());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signos Vitales/Datos Antropométricos'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccessSignosVitales) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExamenFisicoPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepSignosVitales,
              onStepContinue: () {
                if (state.currentStepSignosVitales < 6) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepSignosVitales(
                      step: state.currentStepSignosVitales + 1));
                } else {
                  _submitSignosVitales(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepSignosVitales > 0) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepSignosVitales(
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
                          initialValue: state.signosVitales?.peso.toString() ?? '',
                          keyboardType: const TextInputType.numberWithOptions(),
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(
                                  peso: double.tryParse(value)),
                            ));
                          },
                          decoration:
                          const InputDecoration(labelText: 'Peso'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el peso'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.talla ?? '',
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(
                                  talla: value)),
                            );
                          },
                          decoration: const InputDecoration(
                              labelText: 'Talla'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la talla'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.percentilPeso ?? '',
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                signosVitalesModel: signosVitales.copyWith(
                                    percentilPeso: value)),
                            );
                          },
                          decoration: const InputDecoration(
                              labelText: 'Percentil peso'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el percentil peso'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.indiceMasaCorporal ?? '',
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                signosVitalesModel: signosVitales.copyWith(
                                    indiceMasaCorporal: value)),
                            );
                          },
                          decoration:
                          const InputDecoration(labelText: 'Indice de masa corporal'),
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el indice de masa corporal';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          initialValue: state.signosVitales?.valorNutricional ?? '',
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                signosVitalesModel: signosVitales.copyWith(
                                    valorNutricional: value)),
                            );
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Valor nutricional'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el valor nutricional';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.signosVitales?.circunsferenciaAbdominal.toString() ?? '',
                          onChanged: (value){
                            var signosVitales =
                                state.signosVitales ?? SignosVitalesModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateSignosVitales(
                                signosVitalesModel: signosVitales.copyWith(
                                    circunsferenciaAbdominal: double.tryParse(value))),
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
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(sistolica: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Sistólica'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la presión sistólica' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.diastolica ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(diastolica: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Diastólica'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la presión diastólica' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.media ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(media: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Media'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la presión media' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.postura ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(postura: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Postura'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la postura' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.ubicacion ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(ubicacion: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Ubicación'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la ubicación' : null,
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
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(valor: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa el valor del pulso' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.caracteristicas ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(caracteristicas: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Características'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa las características' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.pulsoUbicacion ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(pulsoUbicacion: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Ubicación'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la ubicación' : null,
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
                        TextFormField(
                          initialValue: state.signosVitales?.frCarateristicas ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(frCarateristicas: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Características'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa las características' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.frValor ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(frValor: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa el valor' : null,
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
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(temperatura: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Temperatura'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la temperatura' : null,
                        ),

                        TextFormField(
                          initialValue: state.signosVitales?.localizacion ?? '',
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(localizacion: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Localización'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa la localización' : null,
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
                          onChanged: (value) {
                            var signosVitales = state.signosVitales ?? SignosVitalesModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateSignosVitales(
                              signosVitalesModel: signosVitales.copyWith(fcValor: value),
                            ));
                          },
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa el valor' : null,
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
