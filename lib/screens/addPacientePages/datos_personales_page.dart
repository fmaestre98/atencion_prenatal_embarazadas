import 'dart:math';

import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import '../../models/personal_data_model.dart';
import '../../router/routes.dart';
import 'interrogatorios_page.dart';

class DatosPersonalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();

  DatosPersonalesPage({Key? key}) : super(key: key);

  void _selectDateTime(BuildContext context, AddPacienteState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      var paciente = state.paciente ?? Paciente(id: 0);
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(
            paciente: paciente.copyWith(fechaNacimiento: picked),
          ));
    }
  }

  void _selectDateTime1(
      BuildContext context, Null Function(dynamic value) onChange) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      onChange(picked);
    }
  }

  void _selectDateTimeUltimaMenstruacion(
      BuildContext context, AddPacienteState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      var embarazo = state.embarazoActual ?? EmbarazoActual(id: 0);
      context.read<AddPacienteBloc>().add(UpdateEmbarazoActual(
            embarazoActual: embarazo.copyWith(fechaUltimaMenstruacion: picked),
          ));
    }
  }

  void _selectDateTimePartoEstimado(
      BuildContext context, AddPacienteState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      var embarazo = state.embarazoActual ?? EmbarazoActual(id: 0);
      context.read<AddPacienteBloc>().add(UpdateEmbarazoActual(
            embarazoActual: embarazo.copyWith(fechaPartoEstimado: picked),
          ));
    }
  }

  void _submitDatosPersonales(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate()) {
      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(SubmitPaciente());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccess != current.isSuccess ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.isSuccess) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            context.pushReplacement(Routes.routeAddInterrogatorio);
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.paciente != current.paciente ||
            current.currentStepDatosPersonales !=
                previous.currentStepDatosPersonales ||
            previous.embarazoActual != current.embarazoActual ||
            previous.embarazoActual != current.embarazoActual ||
               previous.antecedentesObstetricos != current.antecedentesObstetricos ||
            previous.antecedentesGinecologicos != current.antecedentesGinecologicos ||
                previous.antecedentesGinecologicos != current.antecedentesGinecologicos ||
                previous.antecedentesPatologicosPersonales != current.antecedentesPatologicosPersonales ||
        previous.embarazoList != current.embarazoList,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepDatosPersonales,
              onStepContinue: () {
                bool update = false;
                if (state.currentStepDatosPersonales < 8) {
                  if (state.currentStepDatosPersonales == 0) {
                    if (_formKey.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 1) {
                    if (_formKey2.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 2) {
                    if (_formKey3.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 3) {
                    if (_formKey4.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 4) {
                    if (_formKey5.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 5) {
                    if (_formKey6.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 6) {
                    if (_formKey7.currentState!.validate()) {
                      update = true;
                    }
                  } else if (state.currentStepDatosPersonales == 7) {
                    update = true;
                  }
                  if (update) {
                    context.read<AddPacienteBloc>().add(UpdateCurrentStep(
                        step: state.currentStepDatosPersonales + 1));
                  }
                } else {
                  _submitDatosPersonales(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepDatosPersonales > 0) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStep(
                      step: state.currentStepDatosPersonales - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Datos generales'),
                  isActive: state.currentStepDatosPersonales >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.paciente?.nombre ?? '',
                          decoration:
                              const InputDecoration(labelText: 'Nombre'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el nombre'
                              : null,
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(nombre: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.primerApellido ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Primer Apellido'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el primer apellido'
                              : null,
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(primerApellido: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.segundoApellido ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Segundo Apellido'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el segundo apellido'
                              : null,
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(segundoApellido: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.noIdentidad ?? '',
                          decoration:
                              const InputDecoration(labelText: 'No. Identidad'),
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el No. Identidad';
                            }
                            if (value.length != 11) {
                              return 'El No. Identidad debe tener 11 dígitos';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(noIdentidad: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.edad?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Edad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la edad';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      edad: int.tryParse(value)),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.paciente?.fechaNacimiento == null
                                    ? 'Fecha de Nacimiento'
                                    : 'Fecha: ${state.paciente?.fechaNacimiento!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDateTime(context, state),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue: state.paciente?.aboRh ?? '',
                          decoration:
                              const InputDecoration(labelText: 'ABO Rh'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el grupo sanguíneo ABORh'
                              : null,
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(aboRh: value),
                                ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.paciente?.tipoDePaciente ?? 'Nacional',
                          decoration: const InputDecoration(
                              labelText: 'Tipo de paciente'),
                          items:
                              ['Nacional', 'Internacional'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el tipo de paciente';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(tipoDePaciente: value),
                                ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.paciente?.sexo ?? "Femenino",
                          decoration: const InputDecoration(labelText: 'Sexo'),
                          items: ['Femenino', 'Masculino', 'Otro']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(sexo: newValue),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Otros datos'),
                  isActive: state.currentStepDatosPersonales >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        // Unidad Hospitalaria
                        TextFormField(
                          initialValue:
                              state.paciente?.unidadHospitalaria ?? "",
                          decoration: const InputDecoration(
                              labelText: 'Unidad Hospitalaria'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la unidad hospitalaria';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      unidadHospitalaria: newValue),
                                ));
                          },
                        ),
                        // Policlinico
                        TextFormField(
                          initialValue: state.paciente?.policlinico ?? "",
                          decoration:
                              const InputDecoration(labelText: 'Policlinico'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el policlinico';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(policlinico: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.direccion ?? "",
                          decoration:
                              const InputDecoration(labelText: 'Dirección'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la dirección'
                              : null,
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(direccion: newValue),
                                ));
                          },
                        ),
                        // Estado Civil
                        DropdownButtonFormField<String>(
                          value: state.paciente?.estadoCivil ?? "Casado",
                          decoration:
                              const InputDecoration(labelText: 'Estado Civil'),
                          items: [
                            'Casado',
                            'Soltero',
                            'Divorciado',
                            'Viudo',
                            'Unido',
                            'Separado'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el estado civil';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(estadoCivil: newValue),
                                ));
                          },
                        ),
                        // Escolaridad
                        DropdownButtonFormField<String>(
                          value: state.paciente?.escolaridad ?? "Ninguno",
                          decoration:
                              const InputDecoration(labelText: 'Escolaridad'),
                          items: [
                            'Ninguno',
                            'Primaria',
                            'Secundaria básica',
                            'Obrero calificado',
                            'Pre-universitario',
                            'Técnico medio',
                            'Universitario'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la escolaridad';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(escolaridad: newValue),
                                ));
                          },
                        ),
                        // Consultorio
                        TextFormField(
                          initialValue: state.paciente?.consultorio ?? "",
                          decoration:
                              const InputDecoration(labelText: 'Consultorio'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el consultorio';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(consultorio: newValue),
                                ));
                          },
                        ),
                        // Ocupación
                        TextFormField(
                          initialValue: state.paciente?.ocupacion ?? "",
                          decoration:
                              const InputDecoration(labelText: 'Ocupación'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la ocupación';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(ocupacion: newValue),
                                ));
                          },
                        ),
                        // No. Dormitorios
                        TextFormField(
                          initialValue:
                              state.paciente?.noDormitorios?.toString() ?? '',
                          decoration: const InputDecoration(
                              labelText: 'No. Dormitorios'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el número de dormitorios';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Ingresa un número válido';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      noDormitorios: int.tryParse(newValue)),
                                ));
                          },
                        ),
                        // No. Personas en Núcleo Personal
                        TextFormField(
                          initialValue: state.paciente?.noPersonasNucleoPersonal
                              ?.toString(),
                          decoration: const InputDecoration(
                              labelText: 'No. Personas en Núcleo Personal'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el número de personas';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Ingresa un número válido';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      noPersonasNucleoPersonal:
                                          int.tryParse(newValue)),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Embarazo actual'),
                  isActive: state.currentStepDatosPersonales >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.embarazoActual?.fechaUltimaMenstruacion ==
                                        null
                                    ? 'Fecha última menstruación'
                                    : 'Fecha: ${state.embarazoActual?.fechaUltimaMenstruacion!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTimeUltimaMenstruacion(
                                      context, state),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        CheckboxListTile(
                          value: state.embarazoActual?.noConfiable ?? false,
                          onChanged: (value) {
                            var embarazo =
                                state.embarazoActual ?? EmbarazoActual(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateEmbarazoActual(
                                  embarazoActual:
                                      embarazo.copyWith(noConfiable: value),
                                ));
                          },
                          title: const Text("No confiable"),
                        ),
                        CheckboxListTile(
                          value: state.embarazoActual?.desconocida ?? false,
                          onChanged: (value) {
                            var embarazo =
                                state.embarazoActual ?? EmbarazoActual(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateEmbarazoActual(
                                  embarazoActual:
                                      embarazo.copyWith(desconocida: value),
                                ));
                          },
                          title: const Text("Desconocido"),
                        ),
                        TextFormField(
                          initialValue:
                              state.embarazoActual?.captacion?.toString(),
                          decoration:
                              const InputDecoration(labelText: 'Captacion'),
                          keyboardType: TextInputType.number,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la captación'
                              : null,
                          onChanged: (value) {
                            var embarazo =
                                state.embarazoActual ?? EmbarazoActual(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateEmbarazoActual(
                                  embarazoActual: embarazo.copyWith(
                                      captacion: int.tryParse(value)),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.embarazoActual?.semanas?.toString(),
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'Semanas'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las semanas'
                              : null,
                          onChanged: (value) {
                            var embarazo =
                                state.embarazoActual ?? EmbarazoActual(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateEmbarazoActual(
                                  embarazoActual: embarazo.copyWith(
                                      semanas: int.tryParse(value)),
                                ));
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.embarazoActual?.fechaPartoEstimado == null
                                    ? 'Fecha probable parto'
                                    : 'Fecha: ${state.embarazoActual?.fechaPartoEstimado!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTimePartoEstimado(context, state),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Diagnóstico'),
                  isActive: state.currentStepDatosPersonales >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.paciente?.tipoDeRiesgo,
                          decoration: const InputDecoration(
                              labelText: 'Tipo de Riesgo'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el tipo de riesgo'
                              : null,
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(tipoDeRiesgo: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.codigo,
                          decoration:
                              const InputDecoration(labelText: 'Código'),
                          maxLines: 1,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el código'
                              : null,
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(codigo: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.descripcion,
                          decoration:
                              const InputDecoration(labelText: 'Descripción'),
                          maxLines: 3,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la descripción'
                              : null,
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(descripcion: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.datosDeInteres,
                          decoration: const InputDecoration(
                              labelText: 'Datos de Interés'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa los datos de interés';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      datosDeInteres: newValue),
                                ));
                          },
                        ),
                        // Tipo de Diagnóstico
                        TextFormField(
                          initialValue: state.paciente?.tipoDeDiagnostico,
                          decoration: const InputDecoration(
                              labelText: 'Tipo de Diagnóstico'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el tipo de diagnóstico';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      tipoDeDiagnostico: newValue),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.estructura,
                          decoration:
                              const InputDecoration(labelText: 'Estructura'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la estructura';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente:
                                      paciente.copyWith(estructura: newValue),
                                ));
                          },
                        ),
                        // Conducta Seguidora
                        TextFormField(
                          initialValue: state.paciente?.conductaSeguida,
                          decoration: const InputDecoration(
                              labelText: 'Conducta Seguida'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la conducta seguida';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                      conductaSeguida: newValue),
                                ));
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Antecedentes patológicos personales'),
                  isActive: state.currentStepDatosPersonales >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10,),
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesGenerales ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermermedades generales',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(enfermedadesGenerales: value),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades endocrinas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesEndocrinas ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades endocrinas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesEndocrinas: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades respiratorias
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesRespiratorias ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades respiratorias',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesRespiratorias: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades cardiovasculares
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesCardiovasculares ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades cardiovasculares',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesCardiovasculares: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades digestivas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesDigestivas ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades digestivas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesDigestivas: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades renales
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesRenales ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades renales',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesRenales: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades neuronales
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesNeuronales ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades neuronales',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesNeuronales: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades hematológicas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesHematologicas ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades hematológicas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesHematologicas: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades reumatológicas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesReumatologicas ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades reumatológicas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesReumatologicas: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades de transmisión sexual
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesTransmisionSexual ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades de transmisión sexual',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesTransmisionSexual: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Enfermedades ginecológicas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.enfermedadesGinecologicas ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Enfermedades ginecológicas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    enfermedadesGinecologicas: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 32),

                        // Antecedentes familiares
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.antecedentesFamiliares ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Antecedentes familiares',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    antecedentesFamiliares: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Antecedentes quirúrgicos
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.antecedentesQuirugicos ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Antecedentes quirúrgicos',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    antecedentesQuirugicos: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        // Hábitos psicobiológicos
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.habitosPsicobiologicos ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Hábitos psicobiológicos',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    habitosPsicobiologicos: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Transfusiones previas
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.transfusionesPrevias ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Transfusiones previas',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    transfusionesPrevias: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),

                        // Inmunizaciones
                        TextFormField(
                          initialValue: state.antecedentesPatologicosPersonales
                                  ?.inmunizaciones ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Inmunizaciones',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentesPatologicosPersonales =
                                state.antecedentesPatologicosPersonales ??
                                    AntecedentesPatologicosPersonales(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesPatologicosPersonales(
                                  model: antecedentesPatologicosPersonales
                                      .copyWith(
                                    inmunizaciones: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Antecedentes ginecológicos'),
                  isActive: state.currentStepDatosPersonales >= 5,
                  content: Form(
                      key: _formKey6,
                      child: Column(children: <Widget>[
                        const Text('Menarquía'),
                        TextFormField(
                          initialValue: state
                              .antecedentesGinecologicos?.edadMenarquia
                              ?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Edad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la edad';
                            } else if(int.tryParse(value)! < 17 || int.tryParse(value)! > 18){
                              return 'Entre 7 y 18 años';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            safePrint(antecedente.toString());
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      edadMenarquia: int.tryParse(value)),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.antecedentesGinecologicos
                                  ?.caracteristicasMenarquia ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Características',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            safePrint(antecedente.toString());
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      caracteristicasMenarquia: value),
                                ));
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Menopausia'),
                        TextFormField(
                          initialValue: state
                              .antecedentesGinecologicos?.edadMenopausia
                              ?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Edad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la edad';
                            } else if(int.tryParse(value)! < 40 || int.tryParse(value)! > 55){
                              return 'Entre 40 y 55 años';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            safePrint(antecedente.toString());
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      edadMenopausia: int.tryParse(value)),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.antecedentesGinecologicos
                                  ?.caracteristicasMenopausia ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Características',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      caracteristicasMenopausia: value),
                                ));
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Otros'),
                        TextFormField(
                          initialValue: state
                              .antecedentesGinecologicos?.edadPrimeraRelacion
                              ?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Primera relación sexual'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la edad de la primera relación sexual';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      edadPrimeraRelacion: int.tryParse(value)),
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state
                              .antecedentesGinecologicos?.formulaMenstrual
                              ?.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Fórmula menstrual'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la fórmula menstrual';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      formulaMenstrual: value),
                                ));
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.antecedentesGinecologicos
                                            ?.fechaUltimaMenstruacion ==
                                        null
                                    ? 'Fecha última menstruación'
                                    : 'Fecha: ${state.antecedentesGinecologicos?.fechaUltimaMenstruacion!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime1(context, (value) {
                                var antecedente =
                                    state.antecedentesGinecologicos ??
                                        AntecedentesGinecologicos(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateAntecedentesGinecologicos(
                                      model: antecedente.copyWith(
                                          fechaUltimaMenstruacion: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: state.antecedentesGinecologicos
                                  ?.tipoMenstruacion ??
                              'Regular',
                          decoration: const InputDecoration(
                              labelText: 'Tipo de menstuaciones'),
                          items: ['Regular', 'Irregular'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el tipo de menstuaciones';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      tipoMenstruacion: value),
                                ));
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Anticonceptivos'),
                        buildRadioGroup('Barreras:',
                            state.antecedentesGinecologicos?.barrera, (value) {
                          var antecedente = state.antecedentesGinecologicos ??
                              AntecedentesGinecologicos(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateAntecedentesGinecologicos(
                                model: antecedente.copyWith(
                                    barrera: value == 'Sí'),
                              ));
                        }),
                        const SizedBox(height: 5),
                        buildRadioGroup(
                            'DIU:', state.antecedentesGinecologicos?.diu,
                            (value) {
                          var antecedente = state.antecedentesGinecologicos ??
                              AntecedentesGinecologicos(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateAntecedentesGinecologicos(
                                model: antecedente.copyWith(diu: value == 'Sí'),
                              ));
                        }),
                        const SizedBox(height: 5),
                        buildRadioGroup('Hormonales:',
                            state.antecedentesGinecologicos?.hormonales,
                            (value) {
                          var antecedente = state.antecedentesGinecologicos ??
                              AntecedentesGinecologicos(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateAntecedentesGinecologicos(
                                model: antecedente.copyWith(
                                    hormonales: value == 'Sí'),
                              ));
                        }),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.antecedentesGinecologicos
                                            ?.fechaUltimoUso ==
                                        null
                                    ? 'Fecha último'
                                    : 'Fecha: ${state.antecedentesGinecologicos?.fechaUltimoUso!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime1(context, (value) {
                                var antecedente =
                                    state.antecedentesGinecologicos ??
                                        AntecedentesGinecologicos(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateAntecedentesGinecologicos(
                                      model: antecedente.copyWith(
                                          fechaUltimoUso: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.antecedentesGinecologicos
                                  ?.observacionesAnticonceptivos ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Observaciones',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentes =
                                state.antecedentesGinecologicos ??
                                    AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedentes.copyWith(
                                    observacionesAnticonceptivos: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Prueba citológica'),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.antecedentesGinecologicos
                                            ?.fechaPruebaCitologica ==
                                        null
                                    ? 'Fecha realización'
                                    : 'Fecha: ${state.antecedentesGinecologicos?.fechaPruebaCitologica!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime1(context, (value) {
                                var antecedente =
                                    state.antecedentesGinecologicos ??
                                        AntecedentesGinecologicos(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateAntecedentesGinecologicos(
                                      model: antecedente.copyWith(
                                          fechaPruebaCitologica: value),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        DropdownButtonFormField<String>(
                          value: state.antecedentesGinecologicos
                                  ?.resultadoPruebaCitologica ??
                              'Negativa',
                          decoration:
                              const InputDecoration(labelText: 'Resultado'),
                          items: ['Positiva', 'Negativa', 'No util']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el resultado';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var antecedente = state.antecedentesGinecologicos ??
                                AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedente.copyWith(
                                      resultadoPruebaCitologica: value),
                                ));
                          },
                        ),
                        const SizedBox(height: 5),
                        buildRadioGroup(
                            'Fuera de programa:',
                            state.antecedentesGinecologicos
                                ?.fueraDeProgramaPruebaCitologica, (value) {
                          var antecedente = state.antecedentesGinecologicos ??
                              AntecedentesGinecologicos(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateAntecedentesGinecologicos(
                                model: antecedente.copyWith(
                                    fueraDeProgramaPruebaCitologica:
                                        value == 'Sí'),
                              ));
                        }),
                        TextFormField(
                          initialValue: state.antecedentesGinecologicos
                                  ?.observacionesPruebaCitologica ??
                              '',
                          decoration: const InputDecoration(
                            labelText: 'Observaciones',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var antecedentes =
                                state.antecedentesGinecologicos ??
                                    AntecedentesGinecologicos(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateAntecedentesGinecologicos(
                                  model: antecedentes.copyWith(
                                    observacionesPruebaCitologica: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 32),
                      ])),
                ),
                Step(
                  title: const Text('Antecedentes obstétricos'),
                  isActive: state.currentStepDatosPersonales >= 6,
                  content: Form(
                    key: _formKey7,
                    child: Column(
                      children: <Widget>[
                        ...List.generate(
                          state.embarazoList?.length ?? 0,
                          (index) {
                            final embarazo =
                                state.embarazoList![index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text('Embarazo #${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue:
                                      embarazo.numeroEmbarazo?.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'Número de embarazo'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa el número de embarazo';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    var updatedEmbarazo = embarazo.copyWith(
                                        numeroEmbarazo: int.tryParse(value));
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateEmbarazo(
                                          index: index,
                                          model: updatedEmbarazo,
                                        ));
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      embarazo.semanasGestacion?.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'Semanas de gestación'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa las semanas de gestación';
                                    } else if(int.tryParse(value)! < 5 || int.tryParse(value)! > 44){
                                      return 'Entre 5 y 44 semanas';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    var updatedEmbarazo = embarazo.copyWith(
                                        semanasGestacion: int.tryParse(value));
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateEmbarazo(
                                          index: index,
                                          model: updatedEmbarazo,
                                        ));
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: embarazo.patologiasAsociadas,
                                  decoration: const InputDecoration(
                                      labelText:
                                          'Patologías asociadas al embarazo'),
                                  onChanged: (value) {
                                    var updatedEmbarazo = embarazo.copyWith(
                                        patologiasAsociadas: value);
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateEmbarazo(
                                          index: index,
                                          model: updatedEmbarazo,
                                        ));
                                  },
                                ),
                                const SizedBox(height: 10),
                                // Fecha del embarazo
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        embarazo.fecha == null
                                            ? 'Fecha del embarazo'
                                            : 'Fecha: ${embarazo.fecha!.toLocal().toString().split(' ')[0]}',
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          _selectDateTime1(context, (value) {
                                        var updatedEmbarazo =
                                            embarazo.copyWith(fecha: value);
                                        context
                                            .read<AddPacienteBloc>()
                                            .add(UpdateEmbarazo(
                                              index: index,
                                              model: updatedEmbarazo,
                                            ));
                                      }),
                                      child: const Text('Seleccionar'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        context
                                            .read<AddPacienteBloc>()
                                            .add(DeleteEmbarazo(index: index));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<AddPacienteBloc>()
                                .add(AddEmbarazo(model: Embarazo(id: 0)));
                          },
                          child: const Text('Agregar nuevo embarazo'),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Traumatismos y accidentes'),
                  isActive: state.currentStepDatosPersonales >= 7,
                  content: Form(
                      key: _formKey8,
                      child: Column(children: <Widget>[
                        SizedBox(height: 10,),
                        TextFormField(
                          initialValue: state.paciente?.traumatismoAccidentes ?? '',
                          decoration: const InputDecoration(
                            labelText: 'Datos de interés ',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          onChanged: (value) {
                            var paciente = state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                                  paciente: paciente.copyWith(
                                    traumatismoAccidentes: value,
                                  ),
                                ));
                          },
                        ),
                        const SizedBox(height: 32),
                      ])),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepDatosPersonales >= 8,
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
