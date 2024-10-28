import 'dart:math';

import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import '../../models/personal_data_model.dart';
import 'interrogatorios_page.dart';

class DatosPersonalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();


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
      var paciente =
          state.paciente ?? Paciente(id: 0);
      context
          .read<AddPacienteBloc>()
          .add(UpdateDatosPersonales(
        paciente: paciente.copyWith(
            fechaNacimiento: picked),
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

  void _selectDateTimeUltimaMenstruacion(BuildContext context,
      AddPacienteState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      var embarazo =
          state.embarazoActual ?? EmbarazoActual(id: 0);
      context
          .read<AddPacienteBloc>()
          .add(UpdateEmbarazoActual(
        embarazoActual: embarazo.copyWith(
            fechaUltimaMenstruacion: picked),
      ));
    }
  }

  void _selectDateTimePartoEstimado(BuildContext context,
      AddPacienteState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      var embarazo =
          state.embarazoActual ?? EmbarazoActual(id: 0);
      context
          .read<AddPacienteBloc>()
          .add(UpdateEmbarazoActual(
        embarazoActual: embarazo.copyWith(
            fechaPartoEstimado: picked),
      ));
    }
  }

  void _submitDatosPersonales(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate()) {
      // Enviar evento al BLoC
      context
          .read<AddPacienteBloc>()
          .add(SubmitPaciente());
    }
  }

  @override
  Widget build(BuildContext context) {
    safePrint("called build ddddddddd");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
        previous.isSuccess != current.isSuccess
            || previous.errorMessage != current.errorMessage || previous.antecedentes != current.antecedentes,
        listener: (context, state) {
          safePrint("in listenner KKKKKKKKKKKKKKKKK");
          safePrint(state);
          if (state.isSuccess) {
            safePrint(
                "Hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InterrogatorioPage()),
            );
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
        previous.antecedentes != current.antecedentes,
        builder: (context, state) {
          safePrint("called builder datos personales");
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepDatosPersonales,
              onStepContinue: () {
                bool update = false;
                if (state.currentStepDatosPersonales < 5) {
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
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el nombre'
                              : null,
                          onChanged: (value) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  nombre: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.primerApellido ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Primer Apellido'),
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el primer apellido'
                              : null,
                          onChanged: (value) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  primerApellido: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.segundoApellido ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Segundo Apellido'),
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el segundo apellido'
                              : null,
                          onChanged: (value) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  segundoApellido: value),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  noIdentidad: value),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                                    : 'Fecha: ${state.paciente?.fechaNacimiento!
                                    .toLocal().toString().split(' ')[0]}',
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
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el grupo sanguíneo ABORh'
                              : null,
                          onChanged: (value) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  aboRh: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.tipoDePaciente ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Tipo de paciente'),
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el tipo de paciente'
                              : null,
                          onChanged: (value) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  tipoDePaciente: value),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  sexo: newValue),
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
                          initialValue: state.paciente?.unidadHospitalaria ??
                              "",
                          decoration: const InputDecoration(
                              labelText: 'Unidad Hospitalaria'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la unidad hospitalaria';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  policlinico: newValue),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.direccion ?? "",
                          decoration:
                          const InputDecoration(labelText: 'Dirección'),
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa la dirección'
                              : null,
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  direccion: newValue),
                            ));
                          },
                        ),
                        // Estado Civil
                        TextFormField(
                          initialValue: state.paciente?.estadoCivil ?? "",
                          decoration:
                          const InputDecoration(labelText: 'Estado Civil'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el estado civil';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  estadoCivil: newValue),
                            ));
                          },
                        ),
                        // Escolaridad
                        TextFormField(
                          initialValue: state.paciente?.escolaridad ?? "",
                          decoration:
                          const InputDecoration(labelText: 'Escolaridad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la escolaridad';
                            }
                            return null;
                          },
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  escolaridad: newValue),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  consultorio: newValue),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  ocupacion: newValue),
                            ));
                          },
                        ),
                        // No. Dormitorios
                        TextFormField(
                          initialValue: state.paciente?.noDormitorios
                              ?.toString() ?? '',
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  noPersonasNucleoPersonal: int.tryParse(
                                      newValue)),
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
                                    : 'Fecha: ${state.embarazoActual
                                    ?.fechaUltimaMenstruacion!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]}',
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
                              embarazoActual: embarazo.copyWith(
                                  noConfiable: value),
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
                              embarazoActual: embarazo.copyWith(
                                  desconocida: value),
                            ));
                          },
                          title: const Text("Desconocido"),
                        ),
                        TextFormField(
                          initialValue: state.embarazoActual?.captacion
                              ?.toString(),
                          decoration: const InputDecoration(
                              labelText: 'Captacion'),
                          validator: (value) =>
                          value == null || value.isEmpty
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
                          initialValue: state.embarazoActual?.semanas
                              ?.toString(),
                          decoration: const InputDecoration(
                              labelText: 'Semanas'),
                          validator: (value) =>
                          value == null || value.isEmpty
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
                                state.embarazoActual?.fechaPartoEstimado ==
                                    null
                                    ? 'Fecha probable parto'
                                    : 'Fecha: ${state.embarazoActual
                                    ?.fechaPartoEstimado!.toLocal()
                                    .toString()
                                    .split(' ')[0]}',
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
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el tipo de riesgo'
                              : null,
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  tipoDeRiesgo: newValue),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.codigo,
                          decoration:
                          const InputDecoration(labelText: 'Código'),
                          maxLines: 1,
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa el código'
                              : null,
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  codigo: newValue),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.paciente?.descripcion,
                          decoration:
                          const InputDecoration(labelText: 'Descripción'),
                          maxLines: 3,
                          validator: (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor ingresa la descripción'
                              : null,
                          onChanged: (newValue) {
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  descripcion: newValue),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateDatosPersonales(
                              paciente: paciente.copyWith(
                                  estructura: newValue),
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
                            var paciente =
                                state.paciente ?? Paciente(id: 0);
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
                  title: const Text('Antecedentes'),
                  isActive: state.currentStepDatosPersonales >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        if (state.antecedentes != null)
                          ...state.antecedentes!.asMap().entries.map((entry) {
                            int index = entry.key;
                            var antecedente = entry.value;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Antecedente ${index + 1}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          // Lógica para eliminar el feto
                                          context.read<AddPacienteBloc>().add(
                                              DeleteAntecedente(index: index));
                                        },
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    initialValue: antecedente.tipo,
                                    decoration: const InputDecoration(labelText: 'Tipo'),
                                    onChanged: (value) {
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateAntecedente(
                                        index: index,
                                        antecedente: antecedente.copyWith(tipo: value),
                                      ));
                                    },
                                  ),
                                  TextFormField(
                                    initialValue: antecedente.descripcion,
                                    decoration: const InputDecoration(labelText: 'Descripcion'),
                                    onChanged: (value) {
                                      context
                                          .read<AddPacienteBloc>()
                                          .add(UpdateAntecedente(
                                        index: index,
                                        antecedente: antecedente.copyWith(descripcion: value),
                                      ));
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          antecedente.fecha == null
                                              ? 'Fecha'
                                              : 'Fecha: ${antecedente.fecha!.toLocal().toString().split(' ')[0]}',
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () =>
                                            _selectDateTime1(context, (value) {
                                              context
                                                  .read<AddPacienteBloc>()
                                                  .add(UpdateAntecedente(
                                                index: index,
                                                antecedente: antecedente.copyWith(fecha: value),
                                              ));
                                            }),
                                        child: const Text('Seleccionar'),
                                      ),
                                    ],
                                  ),
                                ],
                            );
                          }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar un nuevo feto
                            var newAntecedente = Antecedente();
                            context.read<AddPacienteBloc>().add(
                                AddAntecedente(antecedente: newAntecedente));
                          },
                          child: const Text('Agregar antecedente'),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepDatosPersonales >= 5,
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
