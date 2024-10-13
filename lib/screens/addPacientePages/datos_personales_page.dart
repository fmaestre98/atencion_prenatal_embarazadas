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

  // Controladores de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _primerApellidoController =
      TextEditingController();
  final TextEditingController _segundoApellidoController =
      TextEditingController();
  String sexo = 'Femenino';
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _noIdentidadController = TextEditingController();
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
  final TextEditingController _conductaSeguidaController =
      TextEditingController();

  DatosPersonalesPage({Key? key}) : super(key: key);

  void _selectFechaNacimiento(BuildContext context) async {
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

  void _submitDatosPersonales(BuildContext context) {
    if (_formKey.currentState!.validate()) {
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
        tipoDePaciente: 'Nuevo',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          safePrint("AAAAAAAAAAAADDDDDDDDDDDDDFFFFFFFFFF");
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
            _datosDeInteresController.text = state.paciente?.datosDeInteres != null
          ? state.paciente!.datosDeInteres!
              : '';
            _tipoDeDiagnosticoController.text = state.paciente?.tipoDeDiagnostico != null
          ? state.paciente!.tipoDeDiagnostico!
              : '';
            _descripcionController.text = state.paciente?.descripcion != null
          ? state.paciente!.descripcion!
              : '';
            _estructuraController.text = state.paciente?.estructura != null
          ? state.paciente!.estructura!
              : '';
            _conductaSeguidaController.text = state.paciente?.conductaSeguida != null
          ? state.paciente!.conductaSeguida!
              : '';
           safePrint("PPPPPPPPPPPSSSSSSSSSSSSSSSSSSSSSSSS");
          context
                .read<AddPacienteBloc>()
                .add(const UpdatePacienteLoaded(pacienteLoaded: false));
          }
        },
        builder: (context, state) {
          safePrint("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  // Campos de formulario
                  TextFormField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _primerApellidoController,
                    decoration:
                        const InputDecoration(labelText: 'Primer Apellido'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el primer apellido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _segundoApellidoController,
                    decoration:
                        const InputDecoration(labelText: 'Segundo Apellido'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el segundo apellido';
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
                        onPressed: () => _selectFechaNacimiento(context),
                        child: const Text('Seleccionar'),
                      ),
                    ],
                  ),
                  if (state.fechaNacimiento == null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Por favor selecciona una fecha',
                        style: TextStyle(color: Colors.red[700], fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: sexo,
                    decoration: const InputDecoration(labelText: 'Sexo'),
                    items:
                        ['Femenino', 'Masculino', 'Otro'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      sexo = newValue!;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Dirección
                  TextFormField(
                    controller: _direccionController,
                    decoration: const InputDecoration(labelText: 'Dirección'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa la dirección';
                      }
                      return null;
                    },
                  ),
                  // No. Identidad
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
                  // ABORh
                  TextFormField(
                    controller: _aboRhController,
                    decoration: const InputDecoration(labelText: 'ABO Rh'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el grupo sanguíneo ABORh';
                      }
                      return null;
                    },
                  ),
                  // Unidad Hospitalaria
                  TextFormField(
                    controller: _unidadHospitalariaController,
                    decoration:
                        const InputDecoration(labelText: 'Unidad Hospitalaria'),
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
                    decoration: const InputDecoration(labelText: 'Policlinico'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el policlinico';
                      }
                      return null;
                    },
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
                    decoration: const InputDecoration(labelText: 'Escolaridad'),
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
                    decoration: const InputDecoration(labelText: 'Consultorio'),
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
                    decoration: const InputDecoration(labelText: 'Ocupación'),
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
                    decoration:
                        const InputDecoration(labelText: 'No. Dormitorios'),
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
                  // Tipo de Riesgo
                  TextFormField(
                    controller: _tipoDeRiesgoController,
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Riesgo'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el tipo de riesgo';
                      }
                      return null;
                    },
                  ),
                  // Datos de Interés
                  TextFormField(
                    controller: _datosDeInteresController,
                    decoration:
                        const InputDecoration(labelText: 'Datos de Interés'),
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
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Diagnóstico'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el tipo de diagnóstico';
                      }
                      return null;
                    },
                  ),
                  // Descripción
                  TextFormField(
                    controller: _descripcionController,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa la descripción';
                      }
                      return null;
                    },
                  ),
                  // Estructura
                  TextFormField(
                    controller: _estructuraController,
                    decoration: const InputDecoration(labelText: 'Estructura'),
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
                    decoration:
                        const InputDecoration(labelText: 'Conducta Seguidora'),
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
          );
        },
      ),
    );
  }
}
