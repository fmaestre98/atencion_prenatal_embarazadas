import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../models/interrogatory_model.dart';

class ResumenAtencionPage extends StatelessWidget {
  ResumenAtencionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de la Atención'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Embarazada agregada exitosamente')),
            );
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          }
        },
        builder: (context, state) {
          if (state.isSubmitting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildSectionHeader('Datos Personales'),
                _buildPersonalDataSection(state),

                const SizedBox(height: 20),
                _buildSectionHeader('Signos Vitales'),
                _buildVitalSignsSection(state),

                const SizedBox(height: 20),
                _buildSectionHeader('Interrogatorio'),
                _buildInterrogatorioSection(state),

                const SizedBox(height: 20),
                _buildSectionHeader('Examen Físico'),
                _buildExamenFisicoSection(state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPersonalDataSection(AddPacienteState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Nombre', '${state.paciente?.nombre} ${state.paciente?.primerApellido} ${state.paciente?.segundoApellido}'),
        _buildInfoRow('Fecha de Nacimiento', state.paciente?.fechaNacimiento?.toLocal().toString().split(' ')[0] ?? ''),
        _buildInfoRow('Sexo', state.paciente?.sexo),
        _buildInfoRow('Dirección', state.paciente?.direccion),
        _buildInfoRow('No. Identidad', state.paciente?.noIdentidad),
        _buildInfoRow('ABO Rh', state.paciente?.aboRh),
        _buildInfoRow('Unidad Hospitalaria', state.paciente?.unidadHospitalaria),
        _buildInfoRow('Estado Civil', state.paciente?.estadoCivil),
        _buildInfoRow('Escolaridad', state.paciente?.escolaridad),
        _buildInfoRow('Consultorio', state.paciente?.consultorio),
        _buildInfoRow('Ocupación', state.paciente?.ocupacion),
        _buildInfoRow('Tipo de Diagnóstico', state.paciente?.tipoDeDiagnostico),
        _buildInfoRow('Tipo de Riesgo', state.paciente?.tipoDeRiesgo),
        const Divider(),
      ],
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Flexible(child: Text(value ?? '', textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _buildVitalSignsSection(AddPacienteState state) {
    final signos = state.signosVitales;
    return ExpansionTile(
      title: const Text('Ver detalles de Signos Vitales'),
      children: [
        _buildInfoRow('Peso', '${signos?.peso ?? ''} kg'),
        _buildInfoRow('Talla', '${signos?.talla ?? ''} cm'),
        _buildInfoRow('IMC', signos?.indiceMasaCorporal),
        _buildInfoRow('Temperatura', '${signos?.temperatura ?? ''} °C'),
        _buildInfoRow('Frecuencia Cardíaca', signos?.fcValor),
        _buildInfoRow('Frecuencia Respiratoria', signos?.frValor),
        _buildInfoRow('Circunferencia Abdominal', '${signos?.circunsferenciaAbdominal ?? ''} cm'),
        const Divider(),
      ],
    );
  }

  Widget _buildInterrogatorioSection(AddPacienteState state) {
    final interrogatorio = state.interrogatorio;
    return ExpansionTile(
      title: const Text('Ver detalles de Interrogatorio'),
      children: [
        _buildSystemTile('Sistema Respiratorio', interrogatorio?.srObservaciones, interrogatorio, [
          _buildInfoRow('Disnea', (interrogatorio?.srDisnea ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor', (interrogatorio?.srDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Tos', (interrogatorio?.srTos ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile('Sistema Cardiovascular', interrogatorio?.scObservaciones, interrogatorio, [
          _buildInfoRow('Disnea', (interrogatorio?.scDisnea ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor', (interrogatorio?.scDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Palpitaciones', (interrogatorio?.scPalpitaciones ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile('Sistema Digestivo', interrogatorio?.sdObservaciones, interrogatorio, [
          _buildInfoRow('Náuseas', (interrogatorio?.sdNauseas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor', (interrogatorio?.sdDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Diarreas', (interrogatorio?.sdDiarreas ?? false) ? 'Sí' : 'No'),
        ]),
        // Agrega más sistemas según sea necesario...
      ],
    );
  }

  Widget _buildExamenFisicoSection(AddPacienteState state) {
    final examenFisico = state.examenFisicoModel;
    return ExpansionTile(
      title: const Text('Ver detalles de Examen Físico'),
      children: [
        _buildInfoRow('Semanas de Gestación', examenFisico?.semanasDeGestacion),
        _buildInfoRow('Peso', examenFisico?.peso),
        _buildInfoRow('Altura Uterina', examenFisico?.alturaUterina),
        _buildInfoRow('Circunferencia Abdominal', examenFisico?.circunsferenciaAbdominal),
        _buildInfoRow('Presentación', examenFisico?.presentacion),
        _buildInfoRow('Posición', examenFisico?.posicion),
        _buildInfoRow('Foco Fetal', examenFisico?.focoFetal),
        _buildInfoRow('Movimiento Fetal', examenFisico?.movimientoFetal),
        _buildInfoRow('Tono Uterino', examenFisico?.tonoUterino),
        _buildInfoRow('Edemas', examenFisico?.edemas),
        _buildInfoRow('Dinámica Uterina', examenFisico?.dinamicaUterina),
        const Divider(),
      ],
    );
  }

  Widget _buildSystemTile(String systemName, String? observations, Interrogatorio? interrogatorio, List<Widget> infoRows) {
    return ExpansionTile(
      title: Text(systemName),
      children: [
        Column(children: infoRows),
        if (observations != null && observations.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Observaciones: $observations', style: const TextStyle(color: Colors.grey)),
          ),
      ],
    );
  }
}
