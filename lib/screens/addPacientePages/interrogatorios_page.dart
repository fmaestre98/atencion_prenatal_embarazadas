// lib/screens/interrogatorio_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signos_vitales_page.dart';

class InterrogatorioPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Variables para Interrogatorio
  final TextEditingController _antecedentesMedicosController =
  TextEditingController();
  final TextEditingController _antecedentesFamiliaresController =
  TextEditingController();
  final TextEditingController _habitosController = TextEditingController();
  // Agrega más controladores según tu modelo

  InterrogatorioPage({Key? key}) : super(key: key);

  void _submitInterrogatorio(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Crear objeto Interrogatorio
     /* Interrogatorio interrogatorio = Interrogatorio(
        // Asigna valores específicos según tu modelo
        // Por ejemplo, secciones y elementos
        // Dependiendo de tu implementación, puedes necesitar agregar más detalles
      );

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateInterrogatorio(interrogatorio: interrogatorio));*/

      // Navegar a la siguiente página (Signos Vitales/Datos Antropométricos)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignosVitalesPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interrogatorio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Antecedentes Médicos
              TextFormField(
                controller: _antecedentesMedicosController,
                decoration: InputDecoration(labelText: 'Antecedentes Médicos'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los antecedentes médicos';
                  }
                  return null;
                },
              ),
              // Antecedentes Familiares
              TextFormField(
                controller: _antecedentesFamiliaresController,
                decoration: InputDecoration(labelText: 'Antecedentes Familiares'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los antecedentes familiares';
                  }
                  return null;
                },
              ),
              // Hábitos
              TextFormField(
                controller: _habitosController,
                decoration: InputDecoration(labelText: 'Hábitos'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los hábitos';
                  }
                  return null;
                },
              ),
              // Agrega más campos según tu modelo
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitInterrogatorio(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
