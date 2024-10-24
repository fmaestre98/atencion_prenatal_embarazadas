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

  // Controladores de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _primerApellidoController =
      TextEditingController();
  final TextEditingController _segundoApellidoController =
      TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  String sexo = 'Femenino';
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _noIdentidadController = TextEditingController();
  final TextEditingController _tipoDePacienteController =
      TextEditingController(text: "Nacional");
  final TextEditingController _aboRhController = TextEditingController();
  final TextEditingController _unidadHospitalariaController =
      TextEditingController();
  final TextEditingController _policlinicoController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _escolaridadController = TextEditingController();
  final TextEditingController _consultorioController = TextEditingController();
  final TextEditingController _ocupacionController = TextEditingController();
  final TextEditingController _noDormitoriosController =
      TextEditingController();
  final TextEditingController _noPersonasNucleoPersonalController =
      TextEditingController();
  final TextEditingController _tipoDeRiesgoController = TextEditingController();
  final TextEditingController _datosDeInteresController =
      TextEditingController();
  final TextEditingController _tipoDeDiagnosticoController =
      TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _estructuraController = TextEditingController();
  final TextEditingController _conductaSeguidaController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _captacionController = TextEditingController();
  final TextEditingController _semanasController = TextEditingController();

  DatosPersonalesPage({Key? key}) : super(key: key);

  void _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      context
          .read<AddPacienteBloc>()
          .add(UpdateFechaNacimiento(fechaNacimiento: picked));
    }
  }

  void _selectDateTimeUltimaMenstruacion(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      context
          .read<AddPacienteBloc>()
          .add(UpdateUltimaMenstruacion(fecha: picked));
    }
  }

  void _selectDateTimePartoEstimado(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      context
          .read<AddPacienteBloc>()
          .add(UpdateFechaProbableParto(fecha: picked));
    }
  }

  void _submitDatosPersonales(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate()) {
      final state = context.read<AddPacienteBloc>().state;
      if (state.fechaNacimiento == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Por favor selecciona una fecha de nacimiento')),
        );
        return;
      }

      // Crear objeto Paciente con los datos personales
      Paciente paciente = Paciente(
        nombre: _nombreController.text,
        primerApellido: _primerApellidoController.text,
        segundoApellido: _segundoApellidoController.text,
        fechaNacimiento: state.fechaNacimiento!,
        sexo: sexo,
        direccion: _direccionController.text,
        tipoDePaciente: _tipoDePacienteController.text,
        // Puedes ajustar según tus necesidades
        noIdentidad: _noIdentidadController.text,
        aboRh: _aboRhController.text,
        unidadHospitalaria: _unidadHospitalariaController.text,
        policlinico: _policlinicoController.text,
        estadoCivil: _estadoCivilController.text,
        escolaridad: _escolaridadController.text,
        consultorio: _consultorioController.text,
        ocupacion: _ocupacionController.text,
        noDormitorios: int.tryParse(_noDormitoriosController.text) ?? 0,
        noPersonasNucleoPersonal:
            int.tryParse(_noPersonasNucleoPersonalController.text) ?? 0,
        tipoDeRiesgo: _tipoDeRiesgoController.text,
        datosDeInteres: _datosDeInteresController.text,
        tipoDeDiagnostico: _tipoDeDiagnosticoController.text,
        descripcion: _descripcionController.text,
        estructura: _estructuraController.text,
        conductaSeguida: _conductaSeguidaController.text,
        fechaDeRegistro: DateTime.now(),
        fechaDeActualizacion: DateTime.now(),
        edad: int.tryParse(_edadController.text),
      );
      safePrint("hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      // Enviar evento al BLoC
      context
          .read<AddPacienteBloc>()
          .add(UpdateDatosPersonales(paciente: paciente));
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
        listener: (context, state) {
          safePrint("in listenner KKKKKKKKKKKKKKKKK");
          safePrint(state);
          if (state.isSuccess) {
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
          } else if (state.pacienteLoaded) {
            _updateControllers(state);
          }
        },
        builder: (context, state) {
          _updateControllers(state);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepDatosPersonales,
              onStepContinue: () {
                if (state.currentStepDatosPersonales < 4) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStep(
                      step: state.currentStepDatosPersonales + 1));
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
                          controller: _nombreController,
                          decoration:
                              const InputDecoration(labelText: 'Nombre'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el nombre'
                              : null,
                        ),
                        TextFormField(
                          controller: _primerApellidoController,
                          decoration: const InputDecoration(
                              labelText: 'Primer Apellido'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el primer apellido'
                              : null,
                        ),
                        TextFormField(
                          controller: _segundoApellidoController,
                          decoration: const InputDecoration(
                              labelText: 'Segundo Apellido'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el segundo apellido'
                              : null,
                        ),
                        TextFormField(
                          controller: _noIdentidadController,
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
                        ),
                        TextFormField(
                          controller: _edadController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Edad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la edad';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.fechaNacimiento == null
                                    ? 'Fecha de Nacimiento'
                                    : 'Fecha: ${state.fechaNacimiento!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDateTime(context),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _aboRhController,
                          decoration:
                              const InputDecoration(labelText: 'ABO Rh'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el grupo sanguíneo ABORh'
                              : null,
                        ),
                        TextFormField(
                          controller: _tipoDePacienteController,
                          decoration: const InputDecoration(
                              labelText: 'Tipo de paciente'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el tipo de paciente'
                              : null,
                        ),
                        DropdownButtonFormField<String>(
                          value: sexo,
                          decoration: const InputDecoration(labelText: 'Sexo'),
                          items: ['Femenino', 'Masculino', 'Otro']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            sexo = newValue ?? '';
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
                          controller: _unidadHospitalariaController,
                          decoration: const InputDecoration(
                              labelText: 'Unidad Hospitalaria'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la unidad hospitalaria';
                            }
                            return null;
                          },
                        ),
                        // Policlinico
                        TextFormField(
                          controller: _policlinicoController,
                          decoration:
                              const InputDecoration(labelText: 'Policlinico'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el policlinico';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _direccionController,
                          decoration:
                              const InputDecoration(labelText: 'Dirección'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la dirección'
                              : null,
                        ),
                        // Estado Civil
                        TextFormField(
                          controller: _estadoCivilController,
                          decoration:
                              const InputDecoration(labelText: 'Estado Civil'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el estado civil';
                            }
                            return null;
                          },
                        ),
                        // Escolaridad
                        TextFormField(
                          controller: _escolaridadController,
                          decoration:
                              const InputDecoration(labelText: 'Escolaridad'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la escolaridad';
                            }
                            return null;
                          },
                        ),
                        // Consultorio
                        TextFormField(
                          controller: _consultorioController,
                          decoration:
                              const InputDecoration(labelText: 'Consultorio'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el consultorio';
                            }
                            return null;
                          },
                        ),
                        // Ocupación
                        TextFormField(
                          controller: _ocupacionController,
                          decoration:
                              const InputDecoration(labelText: 'Ocupación'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la ocupación';
                            }
                            return null;
                          },
                        ),
                        // No. Dormitorios
                        TextFormField(
                          controller: _noDormitoriosController,
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
                        ),
                        // No. Personas en Núcleo Personal
                        TextFormField(
                          controller: _noPersonasNucleoPersonalController,
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
                                  _selectDateTimeUltimaMenstruacion(context),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        CheckboxListTile(
                          value: state.embarazoActual?.noConfiable ?? false,
                          onChanged: (value) {
                            context.read<AddPacienteBloc>().add(UpdateNoConfiable(
                                noConfiable: value ?? false));
                          },
                          title: const Text("No confiable"),
                        ),
                        CheckboxListTile(
                          value: state.embarazoActual?.desconocida ?? false,
                          onChanged: (value) {
                            context.read<AddPacienteBloc>().add(UpdateDesconocida(
                                desconocida: value ?? false));
                          },
                          title: const Text("Desconocido"),
                        ),
                        TextFormField(
                          controller: _captacionController,
                          decoration: const InputDecoration(
                              labelText: 'Captacion'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la captación'
                              : null,
                        ),
                        TextFormField(
                          controller: _semanasController,
                          decoration: const InputDecoration(
                              labelText: 'Semanas'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las semanas'
                              : null,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.embarazoActual?.fechaPartoEstimado ==
                                    null
                                    ? 'Fecha probable parto'
                                    : 'Fecha: ${state.embarazoActual?.fechaPartoEstimado!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTimePartoEstimado(context),
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
                          controller: _tipoDeRiesgoController,
                          decoration: const InputDecoration(
                              labelText: 'Tipo de Riesgo'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el tipo de riesgo'
                              : null,
                        ),
                        TextFormField(
                          controller: _codigoController,
                          decoration:
                          const InputDecoration(labelText: 'Código'),
                          maxLines: 3,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el código'
                              : null,
                        ),
                        TextFormField(
                          controller: _descripcionController,
                          decoration:
                              const InputDecoration(labelText: 'Descripción'),
                          maxLines: 3,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la descripción'
                              : null,
                        ),
                        TextFormField(
                          controller: _datosDeInteresController,
                          decoration: const InputDecoration(
                              labelText: 'Datos de Interés'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa los datos de interés';
                            }
                            return null;
                          },
                        ),
                        // Tipo de Diagnóstico
                        TextFormField(
                          controller: _tipoDeDiagnosticoController,
                          decoration: const InputDecoration(
                              labelText: 'Tipo de Diagnóstico'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa el tipo de diagnóstico';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _estructuraController,
                          decoration:
                              const InputDecoration(labelText: 'Estructura'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la estructura';
                            }
                            return null;
                          },
                        ),
                        // Conducta Seguidora
                        TextFormField(
                          controller: _conductaSeguidaController,
                          decoration: const InputDecoration(
                              labelText: 'Conducta Seguida'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa la conducta seguida';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            _submitDatosPersonales(context);
                          },
                          child: state.isSubmitting
                              ? const CircularProgressIndicator() // Mostrar indicador de carga
                              : const Text('Siguiente'),
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

  _updateControllers(AddPacienteState state){
    _nombreController.text =
    state.paciente?.nombre != null ? state.paciente!.nombre! : '';
    _primerApellidoController.text =
    state.paciente?.primerApellido != null
        ? state.paciente!.primerApellido!
        : '';
    _segundoApellidoController.text =
    state.paciente?.segundoApellido != null
        ? state.paciente!.segundoApellido!
        : '';
    _direccionController.text = state.paciente?.direccion != null
        ? state.paciente!.direccion!
        : '';
    _noIdentidadController.text = state.paciente?.noIdentidad != null
        ? state.paciente!.noIdentidad!
        : '';
    _tipoDePacienteController.text =
    state.paciente?.tipoDePaciente != null
        ? state.paciente!.tipoDePaciente!
        : 'Nacional';
    _aboRhController.text =
    state.paciente?.aboRh != null ? state.paciente!.aboRh! : '';
    _unidadHospitalariaController.text =
    state.paciente?.unidadHospitalaria != null
        ? state.paciente!.unidadHospitalaria!
        : '';
    _policlinicoController.text = state.paciente?.policlinico != null
        ? state.paciente!.policlinico!
        : '';
    _estadoCivilController.text = state.paciente?.estadoCivil != null
        ? state.paciente!.estadoCivil!
        : '';
    _escolaridadController.text = state.paciente?.escolaridad != null
        ? state.paciente!.escolaridad!
        : '';
    _consultorioController.text = state.paciente?.consultorio != null
        ? state.paciente!.consultorio!
        : '';
    _ocupacionController.text = state.paciente?.ocupacion != null
        ? state.paciente!.ocupacion!
        : '';
    _noDormitoriosController.text =
    state.paciente?.noDormitorios != null
        ? state.paciente!.noDormitorios.toString()
        : '';
    _noPersonasNucleoPersonalController.text =
    state.paciente?.noPersonasNucleoPersonal != null
        ? state.paciente!.noPersonasNucleoPersonal.toString()
        : '';
    _tipoDeRiesgoController.text = state.paciente?.tipoDeRiesgo != null
        ? state.paciente!.tipoDeRiesgo!
        : '';
    _datosDeInteresController.text =
    state.paciente?.datosDeInteres != null
        ? state.paciente!.datosDeInteres!
        : '';
    _tipoDeDiagnosticoController.text =
    state.paciente?.tipoDeDiagnostico != null
        ? state.paciente!.tipoDeDiagnostico!
        : '';
    _descripcionController.text = state.paciente?.descripcion != null
        ? state.paciente!.descripcion!
        : '';
    _estructuraController.text = state.paciente?.estructura != null
        ? state.paciente!.estructura!
        : '';
    _conductaSeguidaController.text =
    state.paciente?.conductaSeguida != null
        ? state.paciente!.conductaSeguida!
        : '';
    _edadController.text = state.paciente?.edad != null
        ? state.paciente!.conductaSeguida!
        : '0';
    _captacionController.text = state.embarazoActual?.captacion != null
        ? state.embarazoActual!.captacion.toString() : "";
    _semanasController.text = state.embarazoActual?.semanas != null
        ? state.embarazoActual!.semanas.toString() : "";
    _codigoController.text = state.paciente?.codigo != null
        ? state.paciente!.codigo! : "";
  }
}
