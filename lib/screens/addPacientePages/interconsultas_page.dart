// lib/screens/interconsultas_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/personal_data_model.dart';
import 'resumen_atencion_page.dart';

class InterconsultasPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _interconsultasController =
  TextEditingController();
  // Agrega más controladores según tu modelo

  InterconsultasPage({Key? key}) : super(key: key);

  void _submitInterconsultas(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Crear objeto Interconsultas (si tienes una entidad separada)
      // Si es parte de Paciente, actualiza el objeto Paciente en el BLoC
      /*Paciente updatedPaciente = state.paciente.copyWith(
        // Añade los campos de interconsultas
        // Por ejemplo:
        // interconsultas: _interconsultasController.text,
      );

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: updatedPaciente));*/

      // Navegar a la página de Resumen de la Atención
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResumenAtencionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interconsultas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Interconsultas
              TextFormField(
                controller: _interconsultasController,
                decoration: InputDecoration(labelText: 'Interconsultas'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las interconsultas';
                  }
                  return null;
                },
              ),
              // Agrega más campos según tu modelo
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitInterconsultas(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
