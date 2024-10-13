// lib/screens/datos_personales_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../models/personal_data_model.dart';
import 'interrogatorios_page.dart';

class DatosPersonalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _primerApellidoController = TextEditingController();
  final TextEditingController _segundoApellidoController = TextEditingController();
  DateTime? _fechaNacimiento;
  String sexo = 'Femenino';
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _noIdentidadController = TextEditingController();
  final TextEditingController _aboRhController = TextEditingController();
  final TextEditingController _unidadHospitalariaController = TextEditingController();
  final TextEditingController _policlinicoController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _escolaridadController = TextEditingController();
  final TextEditingController _consultorioController = TextEditingController();
  final TextEditingController _ocupacionController = TextEditingController();
  final TextEditingController _noDormitoriosController = TextEditingController();
  final TextEditingController _noPersonasNucleoPersonalController = TextEditingController();
  final TextEditingController _tipoDeRiesgoController = TextEditingController();
  final TextEditingController _datosDeInteresController = TextEditingController();
  final TextEditingController _tipoDeDiagnosticoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _estructuraController = TextEditingController();
  final TextEditingController _conductaSeguidaController = TextEditingController();

  DatosPersonalesPage({Key? key}) : super(key: key);

  void _selectFechaNacimiento(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Necesitamos actualizar el valor de _fechaNacimiento
      // Dado que estamos en un StatelessWidget, usamos una variable temporal
      // y luego la pasamos al evento BLoC
      _fechaNacimiento = picked;
    }
  }

  void _submitDatosPersonales(BuildContext context) {
    if (_formKey.currentState!.validate() && _fechaNacimiento != null) {
      // Crear objeto Paciente con los datos personales
      Paciente paciente = Paciente(
        nombre: _nombreController.text,
        primerApellido: _primerApellidoController.text,
        segundoApellido: _segundoApellidoController.text,
        fechaNacimiento: _fechaNacimiento!,
        sexo: sexo,
        direccion: _direccionController.text,
        tipoDePaciente: 'Nuevo', // Puedes ajustar según tus necesidades
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

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: paciente));

      // Navegar a la página de Interrogatorio
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InterrogatorioPage()),
      );
    } else if (_fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una fecha de nacimiento')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Personales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Nombre
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre';
                  }
                  return null;
                },
              ),
              // Primer Apellido
              TextFormField(
                controller: _primerApellidoController,
                decoration: InputDecoration(labelText: 'Primer Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el primer apellido';
                  }
                  return null;
                },
              ),
              // Segundo Apellido
              TextFormField(
                controller: _segundoApellidoController,
                decoration: InputDecoration(labelText: 'Segundo Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el segundo apellido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Fecha de Nacimiento
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _fechaNacimiento == null
                          ? 'Fecha de Nacimiento'
                          : 'Fecha: ${_fechaNacimiento!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectFechaNacimiento(context),
                    child: Text('Seleccionar'),
                  ),
                ],
              ),
              if (_fechaNacimiento == null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Por favor selecciona una fecha',
                    style: TextStyle(color: Colors.red[700], fontSize: 12),
                  ),
                ),
              SizedBox(height: 16),
              // Sexo
              DropdownButtonFormField<String>(
                value: sexo,
                decoration: InputDecoration(labelText: 'Sexo'),
                items: ['Femenino', 'Masculino', 'Otro'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  sexo = newValue!;
                },
              ),
              SizedBox(height: 16),
              // Dirección
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(labelText: 'Dirección'),
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
                decoration: InputDecoration(labelText: 'No. Identidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el No. Identidad';
                  }
                  if (value.length < 13) {
                    return 'El No. Identidad debe tener al menos 13 dígitos';
                  }
                  return null;
                },
              ),
              // ABORh
              TextFormField(
                controller: _aboRhController,
                decoration: InputDecoration(labelText: 'ABO Rh'),
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
                decoration: InputDecoration(labelText: 'Unidad Hospitalaria'),
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
                decoration: InputDecoration(labelText: 'Policlinico'),
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
                decoration: InputDecoration(labelText: 'Estado Civil'),
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
                decoration: InputDecoration(labelText: 'Escolaridad'),
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
                decoration: InputDecoration(labelText: 'Consultorio'),
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
                decoration: InputDecoration(labelText: 'Ocupación'),
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
                decoration: InputDecoration(labelText: 'No. Dormitorios'),
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
                decoration:
                InputDecoration(labelText: 'No. Personas en Núcleo Personal'),
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
                decoration: InputDecoration(labelText: 'Tipo de Riesgo'),
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
                decoration: InputDecoration(labelText: 'Datos de Interés'),
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
                decoration: InputDecoration(labelText: 'Tipo de Diagnóstico'),
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
                decoration: InputDecoration(labelText: 'Descripción'),
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
                decoration: InputDecoration(labelText: 'Estructura'),
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
                decoration: InputDecoration(labelText: 'Conducta Seguidora'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la conducta seguida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitDatosPersonales(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
