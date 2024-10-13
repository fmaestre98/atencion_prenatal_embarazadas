// lib/screens/examen_fisico_page.dart
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import 'laboratorio_page.dart';

class ExamenFisicoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Examen Físico General
              TextFormField(
                controller: _examenFisicoGeneralController,
                decoration: InputDecoration(labelText: 'Examen Físico General'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el examen físico general';
                  }
                  return null;
                },
              ),
              // Examen Específico
              TextFormField(
                controller: _examenEspecificoController,
                decoration: InputDecoration(labelText: 'Examen Específico'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el examen específico';
                  }
                  return null;
                },
              ),
              // Agrega más campos según tu modelo
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitExamenFisico(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
