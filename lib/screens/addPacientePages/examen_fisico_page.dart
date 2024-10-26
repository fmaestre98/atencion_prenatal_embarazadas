// lib/screens/examen_fisico_page.dart
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import 'laboratorio_page.dart';

class ExamenFisicoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _examenFisicoGeneralController =
  TextEditingController();
  final TextEditingController _examenEspecificoController =
  TextEditingController();
  // Agrega más controladores según tu modelo

  ExamenFisicoPage({Key? key}) : super(key: key);

  void _submitExamenFisico(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Crear objeto ExamenFisico (si tienes una entidad separada)
      // Si es parte de Paciente, actualiza el objeto Paciente en el BLoC
      // Suponiendo que ExamenFisico es una parte de Paciente:
     /* Paciente updatedPaciente = context.read<AddPacienteBloc>().state.paciente?.copyWith(
        // Añade los campos de examen físico
        // Por ejemplo:
        // examenFisicoGeneral: _examenFisicoGeneralController.text,
        // examenEspecifico: _examenEspecificoController.text,
      );*/

      // Enviar evento al BLoC
     // context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: updatedPaciente));

      // Navegar a la siguiente página (Laboratorio y Microbiología)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LaboratorioPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen Físico'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccessExamenFisico) {
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
          } else if (state.pacienteLoaded) {
            //_updateControllers(state);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepExamenFisico,
              onStepContinue: () {
                if (state.currentStepExamenFisico < 6) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepSignosVitales(
                      step: state.currentStepExamenFisico + 1));
                } else {
                  //_submitDatosPersonales(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepExamenFisico > 0) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepSignosVitales(
                      step: state.currentStepExamenFisico - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Examen obstétrico'),
                  isActive: state.currentStepExamenFisico >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.signosVitales?.peso.toString() ?? '',
                          onChanged: (value){

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
                  isActive: state.currentStepExamenFisico >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Sistólica'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión sistólica'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Diastólica'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión diastólica'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Media'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presión media'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Postura'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la postura'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Ubicación'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la ubicación'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Pulso'),
                  isActive: state.currentStepExamenFisico >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el valor del pulso'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Características'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las características'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Ubicación'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la ubicación'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Frecuencia Respiratoria'),
                  isActive: state.currentStepExamenFisico >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Características'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las características'
                              : null,
                        ),
                        TextFormField(
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
                  isActive: state.currentStepExamenFisico >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Temperatura'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la temperatura'
                              : null,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Localización'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la localización'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Frecuencia Cardiaca'),
                  isActive: state.currentStepExamenFisico >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Valor'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el valor'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
