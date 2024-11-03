import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';

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
                const SizedBox(height: 20),
                _buildSectionHeader('Laboratorio y Microbiología'),
                _buildLaboratorioMicrobiologiaSection(state),
                const SizedBox(height: 20),
                _buildSectionHeader('Interconsultas'),
                _buildInterconsultasSection(state),
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
        _buildInfoRow('Nombre',
            '${state.paciente?.nombre} ${state.paciente?.primerApellido} ${state.paciente?.segundoApellido}'),
        _buildInfoRow(
            'Fecha de Nacimiento',
            state.paciente?.fechaNacimiento
                    ?.toLocal()
                    .toString()
                    .split(' ')[0] ??
                ''),
        _buildInfoRow('Sexo', state.paciente?.sexo),
        _buildInfoRow('Dirección', state.paciente?.direccion),
        _buildInfoRow('No. Identidad', state.paciente?.noIdentidad),
        _buildInfoRow('ABO Rh', state.paciente?.aboRh),
        _buildInfoRow(
            'Unidad Hospitalaria', state.paciente?.unidadHospitalaria),
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
        _buildSystemTile('Datos Antropométricos', null, [
          _buildInfoRow('Peso', '${signos?.peso ?? ''} kg'),
          _buildInfoRow('Talla', '${signos?.talla ?? ''} cm'),
          _buildInfoRow('Percentil de Peso', signos?.percentilPeso ?? ''),
          _buildInfoRow('IMC', signos?.indiceMasaCorporal ?? ''),
          _buildInfoRow('Valor Nutricional', signos?.valorNutricional ?? ''),
          _buildInfoRow('Circunferencia Abdominal',
              '${signos?.circunsferenciaAbdominal ?? ''} cm'),
        ]),
        _buildSystemTile('Tensión Arterial', null, [
          _buildInfoRow('Sistólica', '${signos?.sistolica ?? ''} mmHg'),
          _buildInfoRow('Diastólica', '${signos?.diastolica ?? ''} mmHg'),
          _buildInfoRow('Media', signos?.media ?? ''),
          _buildInfoRow('Postura', signos?.postura ?? ''),
          _buildInfoRow('Ubicación', signos?.ubicacion ?? ''),
        ]),
        _buildSystemTile('Pulso', null, [
          _buildInfoRow('Valor', '${signos?.valor ?? ''} ppm'),
          _buildInfoRow('Características', signos?.caracteristicas ?? ''),
          _buildInfoRow('Ubicación del Pulso', signos?.pulsoUbicacion ?? ''),
        ]),
        _buildSystemTile('Frecuencia Respiratoria', null, [
          _buildInfoRow('Valor', '${signos?.frValor ?? ''} rpm'),
          _buildInfoRow('Características', signos?.frCarateristicas ?? ''),
        ]),
        _buildSystemTile('Temperatura', null, [
          _buildInfoRow('Temperatura', '${signos?.temperatura ?? ''} °C'),
          _buildInfoRow('Localización', signos?.localizacion ?? ''),
        ]),
        _buildSystemTile('Frecuencia Cardíaca', null, [
          _buildInfoRow('Valor', signos?.fcValor ?? ''),
        ]),
        const Divider(),
      ],
    );
  }

  Widget _buildInterrogatorioSection(AddPacienteState state) {
    final interrogatorio = state.interrogatorio;
    return ExpansionTile(
      title: const Text('Ver detalles de Interrogatorio'),
      children: [
        _buildSystemTile(
            'Sistema Respiratorio', interrogatorio?.srObservaciones, [
          _buildInfoRow(
              'Disnea', (interrogatorio?.srDisnea ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Dolor', (interrogatorio?.srDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Hemoptisis',
              (interrogatorio?.srHermoptisis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Expectoración',
              (interrogatorio?.srExpectoracion ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Tos', (interrogatorio?.srTos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.srOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile(
            'Sistema Cardiovascular', interrogatorio?.scObservaciones, [
          _buildInfoRow(
              'Disnea', (interrogatorio?.scDisnea ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Dolor', (interrogatorio?.scDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Claudicación Intermitente',
              (interrogatorio?.scClaudicacionIntermitente ?? false)
                  ? 'Sí'
                  : 'No'),
          _buildInfoRow(
              'Cianosis', (interrogatorio?.scCianosis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Tos', (interrogatorio?.scTos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Palpitaciones',
              (interrogatorio?.scPalpitaciones ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.scOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile('Sistema Digestivo', interrogatorio?.sdObservaciones, [
          _buildInfoRow(
              'Disfagia', (interrogatorio?.sdDisfagia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Dolor', (interrogatorio?.sdDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Cólicos', (interrogatorio?.sdColicos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Hematemesis',
              (interrogatorio?.sdHermatemesis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Acolia', (interrogatorio?.sdAcolia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Pirosis', (interrogatorio?.sdPirosis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Náuseas', (interrogatorio?.sdNauseas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Enterorragia',
              (interrogatorio?.sdEnterorragia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Constipación',
              (interrogatorio?.sdConstipacion ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Acidez', (interrogatorio?.sdAcidez ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Diarreas', (interrogatorio?.sdDiarreas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Aerogastrias',
              (interrogatorio?.sdAerogastrias ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Vómitos', (interrogatorio?.sdVomitos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Melena', (interrogatorio?.sdMelena ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.sdOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile(
            'Sistema Urogenital', interrogatorio?.suObservaciones, [
          _buildInfoRow('Nicturias',
              (interrogatorio?.suNicturioas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Dolor', (interrogatorio?.suDolor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Orinas Turbias',
              (interrogatorio?.suOrinasTurbias ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Exudado Uretral',
              (interrogatorio?.suExudadoUretral ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Disuria', (interrogatorio?.suDisuria ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Retención Urinaria',
              (interrogatorio?.suRetencionUrinaria ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Hematuria',
              (interrogatorio?.suHermaturia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Incontinencia',
              (interrogatorio?.suIncontinencia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Polaquiuria',
              (interrogatorio?.suPolaquiuria ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Uretorragia',
              (interrogatorio?.suUretorragia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Impotencia',
              (interrogatorio?.suImpotiencia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Tumoración',
              (interrogatorio?.suTumoracion ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Cálculos', (interrogatorio?.suCalculos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.suOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile(
            'Sistema Neurológico', interrogatorio?.snObservaciones, [
          _buildInfoRow(
              'Cefaleas', (interrogatorio?.snCefaleas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor Facial',
              (interrogatorio?.snDolorFacial ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Vómitos', (interrogatorio?.snVomitos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor Cervical',
              (interrogatorio?.snDolorCervical ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Vértigos', (interrogatorio?.snVertigos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Dolor Lumbar',
              (interrogatorio?.snDolorLumbar ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Convulsiones',
              (interrogatorio?.snConvulsiones ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Alteración Marcha',
              (interrogatorio?.snAlteracionMarcha ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Déficit Motor',
              (interrogatorio?.snDefictMotor ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Alteración Equilibrio',
              (interrogatorio?.snAlteracionEquilibrio ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Déficit Sensitivo',
              (interrogatorio?.snDeficitSensitivo ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Alteración Visual',
              (interrogatorio?.snAlteracionVisual ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Alteración Conciencia',
              (interrogatorio?.snAlteracionConciencia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Dificultad al Hablar/Entender',
              (interrogatorio?.snDificultadHablarEntender ?? false)
                  ? 'Sí'
                  : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.snOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile('Sistema Endocrino', interrogatorio?.seObservaciones, [
          _buildInfoRow('Hipófisis',
              (interrogatorio?.seHipofisis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Ovarios', (interrogatorio?.seOvarios ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Páncreas', (interrogatorio?.sePancreas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Suprarrenal',
              (interrogatorio?.seSuprarrenal ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Paratiroideas',
              (interrogatorio?.seParatiroideas ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Tiroides', (interrogatorio?.seTiroides ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Testículos',
              (interrogatorio?.seTesticulos ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.seOtros ?? false) ? 'Sí' : 'No'),
        ]),
        _buildSystemTile('Otros Datos', interrogatorio?.observaciones, [
          _buildInfoRow(
              'Astenia', (interrogatorio?.astenia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Anorexia', (interrogatorio?.anorexia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Epistaxis', (interrogatorio?.epistaxis ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Fiebre', (interrogatorio?.fiebre ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Artralgia', (interrogatorio?.artralgia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Polifagia', (interrogatorio?.polifagia ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Edema', (interrogatorio?.edema ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Prurito', (interrogatorio?.prurito ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Pérdida de Peso',
              (interrogatorio?.perdidaPeso ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Ganancia de Peso',
              (interrogatorio?.gananciaPeso ?? false) ? 'Sí' : 'No'),
          _buildInfoRow('Acroparestesias',
              (interrogatorio?.acroparentesias ?? false) ? 'Sí' : 'No'),
          _buildInfoRow(
              'Otros', (interrogatorio?.otros ?? false) ? 'Sí' : 'No'),
        ]),
        const Divider(),
      ],
    );
  }

  Widget _buildExamenFisicoSection(AddPacienteState state) {
    final examenFisico = state.examenFisicoModel;
    return ExpansionTile(
      title: const Text('Ver detalles de Examen Físico'),
      children: [
        _buildSystemTile('Examen Obstétrico', null, [
          _buildInfoRow('Semanas de Gestación',
              examenFisico?.semanasDeGestacion ?? 'No especificado'),
          _buildInfoRow('Peso', examenFisico?.peso ?? 'No especificado'),
          _buildInfoRow('Altura Uterina',
              examenFisico?.alturaUterina ?? 'No especificado'),
          _buildInfoRow('Circunferencia Abdominal',
              examenFisico?.circunsferenciaAbdominal ?? 'No especificado'),
          _buildInfoRow(
              'Presentación', examenFisico?.presentacion ?? 'No especificado'),
          _buildInfoRow(
              'Posición', examenFisico?.posicion ?? 'No especificado'),
          _buildInfoRow(
              'Foco Fetal', examenFisico?.focoFetal ?? 'No especificado'),
          _buildInfoRow('Movimiento Fetal',
              examenFisico?.movimientoFetal ?? 'No especificado'),
          _buildInfoRow(
              'Tono Uterino', examenFisico?.tonoUterino ?? 'No especificado'),
          _buildInfoRow('Edemas', examenFisico?.edemas ?? 'No especificado'),
          _buildInfoRow('Dinámica Uterina',
              examenFisico?.dinamicaUterina ?? 'No especificado'),
        ]),
        _buildSystemTile('General', examenFisico?.gObservacions, [
          _buildInfoRow('Tejido Celular Subcutáneo',
              examenFisico?.tejidoCelularSubcutaneo ?? 'No especificado'),
          _buildInfoRow('Facies', examenFisico?.facies ?? 'No especificado'),
          _buildInfoRow('Piel', examenFisico?.piel ?? 'No especificado'),
          _buildInfoRow('Mucosas', examenFisico?.mucosas ?? 'No especificado'),
          _buildInfoRow('Faneras', examenFisico?.faneras ?? 'No especificado'),
        ]),
        _buildSystemTile('Sistema Respiratorio', examenFisico?.rObservacions, [
          _buildInfoRow(
              'Inspección', examenFisico?.rInspeccion ?? 'No especificado'),
          _buildInfoRow(
              'Palpación', examenFisico?.rPalpacion ?? 'No especificado'),
          _buildInfoRow(
              'Percusión', examenFisico?.rPercucion ?? 'No especificado'),
          _buildInfoRow(
              'Auscultación', examenFisico?.rAuscultacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Área Cardíaca', examenFisico?.acObservacions, [
          _buildInfoRow(
              'Inspección', examenFisico?.acInspeccion ?? 'No especificado'),
          _buildInfoRow(
              'Palpación', examenFisico?.acPalpacion ?? 'No especificado'),
          _buildInfoRow('Auscultación',
              examenFisico?.acAuscultacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Venoso y Linfático', examenFisico?.vlObservacions, [
          _buildInfoRow('Venoso Periférico',
              examenFisico?.venosoPeriferico ?? 'No especificado'),
          _buildInfoRow(
              'Linfático', examenFisico?.linfatico ?? 'No especificado'),
        ]),
        _buildSystemTile('Digestivo Superior', examenFisico?.dsObservacions, [
          _buildInfoRow('Boca', examenFisico?.boca ?? 'No especificado'),
          _buildInfoRow('Lengua', examenFisico?.lengua ?? 'No especificado'),
          _buildInfoRow(
              'Orofaringe', examenFisico?.orofaringe ?? 'No especificado'),
        ]),
        _buildSystemTile('Abdomen', examenFisico?.aObservacions, [
          _buildInfoRow(
              'Inspección', examenFisico?.aInspeccion ?? 'No especificado'),
          _buildInfoRow(
              'Palpación', examenFisico?.aPalpacion ?? 'No especificado'),
          _buildInfoRow(
              'Percusión', examenFisico?.aPercucion ?? 'No especificado'),
          _buildInfoRow(
              'Auscultación', examenFisico?.aAuscultacion ?? 'No especificado'),
          _buildInfoRow(
              'Tacto Rectal', examenFisico?.aTactoRectal ?? 'No especificado'),
        ]),
        _buildSystemTile('Sistema Urinario', examenFisico?.uObservacions, [
          _buildInfoRow(
              'Inspección', examenFisico?.uInspeccion ?? 'No especificado'),
          _buildInfoRow(
              'Palpación', examenFisico?.uPalpacion ?? 'No especificado'),
          _buildInfoRow(
              'Percusión', examenFisico?.uPercucion ?? 'No especificado'),
        ]),
        _buildSystemTile('Vulva y Periné', examenFisico?.vObservaciones, [
          _buildInfoRow('Vulva y Periné',
              examenFisico?.vuelvaPerine ?? 'No especificado'),
        ]),
        _buildSystemTile('Vagina', examenFisico?.vagObservaciones, [
          _buildInfoRow('Vagina', examenFisico?.vagina ?? 'No especificado'),
        ]),
        _buildSystemTile('Cuello', examenFisico?.cObservaciones, [
          _buildInfoRow('Cuello', examenFisico?.cuello ?? 'No especificado'),
        ]),
        _buildSystemTile('Útero', examenFisico?.utObservaciones, [
          _buildInfoRow('Útero', examenFisico?.utero ?? 'No especificado'),
        ]),
        _buildSystemTile('Anejos', examenFisico?.anObservaciones, [
          _buildInfoRow('Anejos', examenFisico?.anejos ?? 'No especificado'),
        ]),
        _buildSystemTile('Mamas', examenFisico?.mObservaciones, [
          _buildInfoRow(
              'Inspección', examenFisico?.mInspeccion ?? 'No especificado'),
          _buildInfoRow(
              'Palpación', examenFisico?.mPalpacion ?? 'No especificado'),
          _buildInfoRow('Aptas para Lactar',
              (examenFisico?.aptasLaptar ?? false) ? 'Sí' : 'No'),
        ]),
        const Divider(),
      ],
    );
  }

  Widget _buildSystemTile(
      String systemName, String? observations, List<Widget> infoRows) {
    return ExpansionTile(
      title: Text(systemName),
      children: [
        Column(children: infoRows),
        if (observations != null && observations.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Observaciones: $observations',
                style: const TextStyle(color: Colors.grey)),
          ),
      ],
    );
  }

  Widget _buildLaboratorioMicrobiologiaSection(AddPacienteState state) {
    final laboratorio = state.laboratorioMicrobiologiaModel;
    return ExpansionTile(
      title: const Text('Ver detalles de Laboratorio y Microbiología'),
      children: [
        _buildSystemTile('Grupo y Factor', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.ghResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.grFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
          _buildInfoRow('Resultado Paterno',
              laboratorio?.ghResultadoPaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Paterno',
              laboratorio?.grFechaRealizacionPaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('VIH', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.vihResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.vihFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
          _buildInfoRow('Resultado Paterno',
              laboratorio?.vihResultadoPaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Paterno',
              laboratorio?.vihFechaRealizacionPaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Serología', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.sResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.sFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
          _buildInfoRow('Resultado Paterno',
              laboratorio?.sResultadoPaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Paterno',
              laboratorio?.sFechaRealizacionPaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Antígeno de Superficie', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.asResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.asFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
          _buildInfoRow('Resultado Paterno',
              laboratorio?.asResultadoPaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Paterno',
              laboratorio?.asFechaRealizacionPaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Hemoglobina (HB)', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.hbResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.hbFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Hematocrito (HTO)', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.htoResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.htoFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Glicemia', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.gResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.gFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('PTG Ayunas', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.ptgaResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.ptgaFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('PTG Dos Horas Después', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.ptg2hResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.ptg2hFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Creatinina', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.cResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.cFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Ácido Úrico', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.auResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.auFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Urea', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.uResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.uFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Colesterol', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.colResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.colFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Triglicéridos', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.tResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.tFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Bilirrubina', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.bResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.bFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('TPG', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.tpgResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.tpgFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('TGO', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.tgoResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.tgoFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('GGT', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.ggtResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.ggtFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Cituria', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.citResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.citFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Urocultivo', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.uroResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.uroFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Heces Fecales', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.hfResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.hfFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Exudado Vaginal Simple', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.evsResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.evsFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Exudado Vaginal Cultivo', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.evcResultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.evcFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        _buildSystemTile('Prueba de Coombs', null, [
          _buildInfoRow('Resultado Materno',
              laboratorio?.pcsultadoMaterno ?? 'No especificado'),
          _buildInfoRow(
              'Fecha Realización Materno',
              laboratorio?.pcFechaRealizacionMaterno?.toLocal().toString() ??
                  'No especificado'),
        ]),
        const Divider(),
      ],
    );
  }

  Widget _buildInterconsultasSection(AddPacienteState state) {
    final interconsultas = state.interconsultasModel;
    return ExpansionTile(
      title: const Text('Interconsultas'),
      children: [
        _buildSystemTile('Psicología', null, [
          _buildInfoRow('Fecha de Consulta', interconsultas?.psFechaConsulta?.toLocal().toString() ?? 'No especificado'),
          _buildInfoRow('Evaluación', interconsultas?.psEvaluacion ?? 'No especificado'),
          _buildInfoRow('Código', interconsultas?.psCodigo ?? 'No especificado'),
          _buildInfoRow('Descripción', interconsultas?.psDescripcion ?? 'No especificado'),
          _buildInfoRow('Estructura', interconsultas?.psEstructura ?? 'No especificado'),
          _buildInfoRow('Tipo de Diagnóstico', interconsultas?.psTipoDiagnostico ?? 'No especificado'),
          _buildInfoRow('Conducta Seguida', interconsultas?.conductaSeguida ?? 'No especificado'),
        ]),
        _buildSystemTile('Nutrición', null, [
          _buildInfoRow('Fecha de Consulta', interconsultas?.nFechaConsulta?.toLocal().toString() ?? 'No especificado'),
          _buildInfoRow('Evaluación', interconsultas?.nEvaluacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Medicina Interna', null, [
          _buildInfoRow('Fecha de Consulta', interconsultas?.miFechaConsulta?.toLocal().toString() ?? 'No especificado'),
          _buildInfoRow('Evaluación', interconsultas?.miEvaluacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Trabajo Social', null, [
          _buildInfoRow('Fecha de Consulta', interconsultas?.tsFechaConsulta?.toLocal().toString() ?? 'No especificado'),
          _buildInfoRow('Evaluación', interconsultas?.tsEvaluacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Defectología', null, [
          _buildInfoRow('Fecha de Consulta', interconsultas?.dFechaConsulta?.toLocal().toString() ?? 'No especificado'),
          _buildInfoRow('Evaluación', interconsultas?.dEvaluacion ?? 'No especificado'),
        ]),
        _buildSystemTile('Estomatología', null, [
          _buildInfoRow('Examen Estomatológico', interconsultas?.examenEstomatologico ?? 'No especificado'),
          _buildInfoRow('Número de Exodoncias', interconsultas?.numeroExodoncia ?? 'No especificado'),
          _buildInfoRow('Exodoncias Realizadas', interconsultas?.realizadasExodoncia ?? 'No especificado'),
          _buildInfoRow('Número de Obturaciones', interconsultas?.numeroObsturaciones ?? 'No especificado'),
          _buildInfoRow('Obturaciones Realizadas', interconsultas?.realizadasObsturaciones ?? 'No especificado'),
        ]),
        _buildSystemTile('Sicoprofilaxis', null, [
          _buildInfoRow('Remitida', interconsultas?.remitida == true ? 'Sí' : 'No'),
          _buildInfoRow('No Asistencia', interconsultas?.noAsistencia ?? 'No especificado'),
          _buildInfoRow('Observaciones', interconsultas?.observaciones ?? 'No especificado'),
        ]),
        const Divider(),
      ],
    );
  }


}
