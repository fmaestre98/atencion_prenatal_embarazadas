import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class InterconsultasModel {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  //psicologia
  DateTime? psFechaConsulta;
  String? psEvaluacion;
  String? psCodigo;
  String? psDescripcion;
  String? psEstructura;
  String? psTipoDiagnostico;
  String? conductaSeguida;

  //nutricion
  DateTime? nFechaConsulta;
  String? nEvaluacion;

  //medicina interna
  DateTime? miFechaConsulta;
  String? miEvaluacion;

  //trabajo social
  DateTime? tsFechaConsulta;
  String? tsEvaluacion;

  //defectologia
  DateTime? dFechaConsulta;
  String? dEvaluacion;

  //estomatologia
  String? examenEstomatologico;
  String? numeroExodoncia;
  String? realizadasExodoncia;
  String? numeroObsturaciones;
  String? realizadasObsturaciones;

  //sicoprofilaxis
  bool? remitida;
  String? noAsistencia;
  String? observaciones;

  InterconsultasModel({
      this.id = 0,
      this.psFechaConsulta,
      this.psEvaluacion,
      this.psCodigo,
      this.psDescripcion,
      this.psEstructura,
      this.psTipoDiagnostico,
      this.conductaSeguida,
      this.nFechaConsulta,
      this.nEvaluacion,
      this.miFechaConsulta,
      this.miEvaluacion,
      this.tsFechaConsulta,
      this.tsEvaluacion,
      this.dFechaConsulta,
      this.dEvaluacion,
      this.examenEstomatologico,
      this.numeroExodoncia,
      this.realizadasExodoncia,
      this.numeroObsturaciones,
      this.realizadasObsturaciones,
      this.remitida,
      this.noAsistencia,
      this.observaciones});

  InterconsultasModel copyWith({
    int? id,
    DateTime? psFechaConsulta,
    String? psEvaluacion,
    String? psCodigo,
    String? psDescripcion,
    String? psEstructura,
    String? psTipoDiagnostico,
    String? conductaSeguida,
    DateTime? nFechaConsulta,
    String? nEvaluacion,
    DateTime? miFechaConsulta,
    String? miEvaluacion,
    DateTime? tsFechaConsulta,
    String? tsEvaluacion,
    DateTime? dFechaConsulta,
    String? dEvaluacion,
    String? examenEstomatologico,
    String? numeroExodoncia,
    String? realizadasExodoncia,
    String? numeroObsturaciones,
    String? realizadasObsturaciones,
    bool? remitida,
    String? noAsistencia,
    String? observaciones,
  }) {
    return InterconsultasModel(
      id: id ?? this.id,
      psFechaConsulta: psFechaConsulta ?? this.psFechaConsulta,
      psEvaluacion: psEvaluacion ?? this.psEvaluacion,
      psCodigo: psCodigo ?? this.psCodigo,
      psDescripcion: psDescripcion ?? this.psDescripcion,
      psEstructura: psEstructura ?? this.psEstructura,
      psTipoDiagnostico: psTipoDiagnostico ?? this.psTipoDiagnostico,
      conductaSeguida: conductaSeguida ?? this.conductaSeguida,
      nFechaConsulta: nFechaConsulta ?? this.nFechaConsulta,
      nEvaluacion: nEvaluacion ?? this.nEvaluacion,
      miFechaConsulta: miFechaConsulta ?? this.miFechaConsulta,
      miEvaluacion: miEvaluacion ?? this.miEvaluacion,
      tsFechaConsulta: tsFechaConsulta ?? this.tsFechaConsulta,
      tsEvaluacion: tsEvaluacion ?? this.tsEvaluacion,
      dFechaConsulta: dFechaConsulta ?? this.dFechaConsulta,
      dEvaluacion: dEvaluacion ?? this.dEvaluacion,
      examenEstomatologico: examenEstomatologico ?? this.examenEstomatologico,
      numeroExodoncia: numeroExodoncia ?? this.numeroExodoncia,
      realizadasExodoncia: realizadasExodoncia ?? this.realizadasExodoncia,
      numeroObsturaciones: numeroObsturaciones ?? this.numeroObsturaciones,
      realizadasObsturaciones: realizadasObsturaciones ?? this.realizadasObsturaciones,
      remitida: remitida ?? this.remitida,
      noAsistencia: noAsistencia ?? this.noAsistencia,
      observaciones: observaciones ?? this.observaciones,
    );
  }
}
