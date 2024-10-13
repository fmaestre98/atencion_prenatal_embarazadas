// lib/screens/laboratorio_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import 'genetica_page.dart';

class LaboratorioPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _resultadosLaboratorioController =
  TextEditingController();
  final TextEditingController _resultadosMicrobiologiaController =
  TextEditingController();
  // Agrega más controladores según tu modelo

  LaboratorioPage({Key? key}) : super(key: key);

  void _submitLaboratorio(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Crear objeto Laboratorio (si tienes una entidad separada)
      // Si es parte de Paciente, actualiza el objeto Paciente en el BLoC
     /* Paciente updatedPaciente = state.paciente.copyWith(
        // Añade los campos de laboratorio
        // Por ejemplo:
        // resultadosLaboratorio: _resultadosLaboratorioController.text,
        // resultadosMicrobiologia: _resultadosMicrobiologiaController.text,
      );

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: updatedPaciente));*/

      // Navegar a la siguiente página (Genética e Imagenología)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GeneticaPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laboratorio y Microbiología'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Resultados de Laboratorio
              TextFormField(
                controller: _resultadosLaboratorioController,
                decoration: InputDecoration(labelText: 'Resultados de Laboratorio'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los resultados de laboratorio';
                  }
                  return null;
                },
              ),
              // Resultados de Microbiología
              TextFormField(
                controller: _resultadosMicrobiologiaController,
                decoration: InputDecoration(labelText: 'Resultados de Microbiología'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los resultados de microbiología';
                  }
                  return null;
                },
              ),
              // Agrega más campos según tu modelo
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitLaboratorio(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
