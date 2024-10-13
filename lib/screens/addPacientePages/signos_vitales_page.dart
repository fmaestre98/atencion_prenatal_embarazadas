// lib/screens/signos_vitales_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import 'examen_fisico_page.dart';

class SignosVitalesPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _presionArterialController = TextEditingController();
  double imc = 0.0;

  SignosVitalesPage({Key? key}) : super(key: key);

  void _calculateIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0.0;
    double alturaCm = double.tryParse(_alturaController.text) ?? 0.0;
    double alturaM = alturaCm / 100;
    if (alturaM > 0) {
      imc = peso / (alturaM * alturaM);
    } else {
      imc = 0.0;
    }
  }

  void _submitSignosVitales(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _calculateIMC();

      // Enviar evento al BLoC
   /*   context.read<AddPacienteBloc>().add(
        UpdateSignosVitales(
          peso: double.parse(_pesoController.text),
          altura: double.parse(_alturaController.text),
          imc: imc,
          presionArterial: _presionArterialController.text,
        ),
      );*/

      // Navegar a la siguiente página (Examen Físico)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExamenFisicoPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signos Vitales/Datos Antropométricos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Peso
              TextFormField(
                controller: _pesoController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _calculateIMC(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el peso';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un valor válido';
                  }
                  return null;
                },
              ),
              // Altura
              TextFormField(
                controller: _alturaController,
                decoration: InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _calculateIMC(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la altura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un valor válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // IMC
              Text(
                'IMC: ${imc.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Presión Arterial
              TextFormField(
                controller: _presionArterialController,
                decoration: InputDecoration(labelText: 'Presión Arterial (mmHg)'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la presión arterial';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _submitSignosVitales(context),
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
