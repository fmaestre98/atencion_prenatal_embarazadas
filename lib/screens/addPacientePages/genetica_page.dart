// lib/screens/genetica_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/personal_data_model.dart';
import 'interconsultas_page.dart';

class GeneticaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _estudiosGeneticosController =
  TextEditingController();
  final TextEditingController _imagenologiaController =
  TextEditingController();
  // Agrega más controladores según tu modelo

  GeneticaPage({Key? key}) : super(key: key);

  void _submitGenetica(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Crear objeto Genetica (si tienes una entidad separada)
      // Si es parte de Paciente, actualiza el objeto Paciente en el BLoC
      /*Paciente updatedPaciente = state.paciente.copyWith(
        // Añade los campos de genética e imagenología
        // Por ejemplo:
        // estudiosGeneticos: _estudiosGeneticosController.text,
        // imagenologia: _imagenologiaController.text,
      );

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: updatedPaciente));*/

      // Navegar a la siguiente página (Interconsultas)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InterconsultasPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genética e Imagenología'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Estudios Genéticos
              TextFormField(
                controller: _estudiosGeneticosController,
                decoration: InputDecoration(labelText: 'Estudios Genéticos'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los estudios genéticos';
                  }
                  return null;
                },
              ),
              // Imagenología
              TextFormField(
                controller: _imagenologiaController,
                decoration: InputDecoration(labelText: 'Imagenología'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la imagenología';
                  }
                  return null;
                },
              ),
              // Agrega más campos según tu modelo
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitGenetica(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
