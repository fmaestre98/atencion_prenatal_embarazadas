import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LaboratorioMicrobiologiaModel {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

//grupo y factor
  String? ghResultadoMaterno;
  DateTime? grFechaRealizacionMaterno;
  String? ghResultadoPaterno;
  DateTime? grFechaRealizacionPaterno;

  //vih
  String? vihResultadoMaterno;
  DateTime? vihFechaRealizacionMaterno;
  String? vihResultadoPaterno;
  DateTime? vihFechaRealizacionPaterno;

  //serologia
  String? sResultadoMaterno;
  DateTime? sFechaRealizacionMaterno;
  String? sResultadoPaterno;
  DateTime? sFechaRealizacionPaterno;

  //antigeno de superficie
  String? asResultadoMaterno;
  DateTime? asFechaRealizacionMaterno;
  String? asResultadoPaterno;
  DateTime? asFechaRealizacionPaterno;

  //hb
  String? hbResultadoMaterno;
  DateTime? hbFechaRealizacionMaterno;

  //hto
  String? htoResultadoMaterno;
  DateTime? htoFechaRealizacionMaterno;

  //glicemia
  String? gResultadoMaterno;
  DateTime? gFechaRealizacionMaterno;

  //ptg ayunas
  String? ptgaResultadoMaterno;
  DateTime? ptgaFechaRealizacionMaterno;

  //ptg dos horas despues
  String? ptg2hResultadoMaterno;
  DateTime? ptg2hFechaRealizacionMaterno;

  //creatinina
  String? cResultadoMaterno;
  DateTime? cFechaRealizacionMaterno;

  //acido urico
  String? auResultadoMaterno;
  DateTime? auFechaRealizacionMaterno;

  //urea
  String? uResultadoMaterno;
  DateTime? uFechaRealizacionMaterno;

  //colesterol
  String? colResultadoMaterno;
  DateTime? colFechaRealizacionMaterno;

  //trigliceridos
  String? tResultadoMaterno;
  DateTime? tFechaRealizacionMaterno;

  //bilirrubina
  String? bResultadoMaterno;
  DateTime? bFechaRealizacionMaterno;

  //tpg
  String? tpgResultadoMaterno;
  DateTime? tpgFechaRealizacionMaterno;

  //tgo
  String? tgoResultadoMaterno;
  DateTime? tgoFechaRealizacionMaterno;

  //ggt
  String? ggtResultadoMaterno;
  DateTime? ggtFechaRealizacionMaterno;

  //cituria
  String? citResultadoMaterno;
  DateTime? citFechaRealizacionMaterno;

  //urocultivo
  String? uroResultadoMaterno;
  DateTime? uroFechaRealizacionMaterno;

  //heces fecales
  String? hfResultadoMaterno;
  DateTime? hfFechaRealizacionMaterno;

  //exudado vaginal simple
  String? evsResultadoMaterno;
  DateTime? evsFechaRealizacionMaterno;

  //exudado vaginal cultivo
  String? evcResultadoMaterno;
  DateTime? evcFechaRealizacionMaterno;

  //prueba de coombs
  String? pcsultadoMaterno;
  DateTime? pcFechaRealizacionMaterno;

  LaboratorioMicrobiologiaModel({
      this.id=0,
      this.ghResultadoMaterno,
      this.grFechaRealizacionMaterno,
      this.ghResultadoPaterno,
      this.grFechaRealizacionPaterno,
      this.vihResultadoMaterno,
      this.vihFechaRealizacionMaterno,
      this.vihResultadoPaterno,
      this.vihFechaRealizacionPaterno,
      this.sResultadoMaterno,
      this.sFechaRealizacionMaterno,
      this.sResultadoPaterno,
      this.sFechaRealizacionPaterno,
      this.asResultadoMaterno,
      this.asFechaRealizacionMaterno,
      this.asResultadoPaterno,
      this.asFechaRealizacionPaterno,
      this.hbResultadoMaterno,
      this.hbFechaRealizacionMaterno,
      this.htoResultadoMaterno,
      this.htoFechaRealizacionMaterno,
      this.gResultadoMaterno,
      this.gFechaRealizacionMaterno,
      this.ptgaResultadoMaterno,
      this.ptgaFechaRealizacionMaterno,
      this.ptg2hResultadoMaterno,
      this.ptg2hFechaRealizacionMaterno,
      this.cResultadoMaterno,
      this.cFechaRealizacionMaterno,
      this.auResultadoMaterno,
      this.auFechaRealizacionMaterno,
      this.uResultadoMaterno,
      this.uFechaRealizacionMaterno,
      this.colResultadoMaterno,
      this.colFechaRealizacionMaterno,
      this.tResultadoMaterno,
      this.tFechaRealizacionMaterno,
      this.bResultadoMaterno,
      this.bFechaRealizacionMaterno,
      this.tpgResultadoMaterno,
      this.tpgFechaRealizacionMaterno,
      this.tgoResultadoMaterno,
      this.tgoFechaRealizacionMaterno,
      this.ggtResultadoMaterno,
      this.ggtFechaRealizacionMaterno,
      this.citResultadoMaterno,
      this.citFechaRealizacionMaterno,
      this.uroResultadoMaterno,
      this.uroFechaRealizacionMaterno,
      this.hfResultadoMaterno,
      this.hfFechaRealizacionMaterno,
      this.evsResultadoMaterno,
      this.evsFechaRealizacionMaterno,
      this.evcResultadoMaterno,
      this.evcFechaRealizacionMaterno,
      this.pcsultadoMaterno,
      this.pcFechaRealizacionMaterno});

  LaboratorioMicrobiologiaModel copyWith({
    int? id,
    String? ghResultadoMaterno,
    DateTime? grFechaRealizacionMaterno,
    String? ghResultadoPaterno,
    DateTime? grFechaRealizacionPaterno,
    String? vihResultadoMaterno,
    DateTime? vihFechaRealizacionMaterno,
    String? vihResultadoPaterno,
    DateTime? vihFechaRealizacionPaterno,
    String? sResultadoMaterno,
    DateTime? sFechaRealizacionMaterno,
    String? sResultadoPaterno,
    DateTime? sFechaRealizacionPaterno,
    String? asResultadoMaterno,
    DateTime? asFechaRealizacionMaterno,
    String? asResultadoPaterno,
    DateTime? asFechaRealizacionPaterno,
    String? hbResultadoMaterno,
    DateTime? hbFechaRealizacionMaterno,
    String? htoResultadoMaterno,
    DateTime? htoFechaRealizacionMaterno,
    String? gResultadoMaterno,
    DateTime? gFechaRealizacionMaterno,
    String? ptgaResultadoMaterno,
    DateTime? ptgaFechaRealizacionMaterno,
    String? ptg2hResultadoMaterno,
    DateTime? ptg2hFechaRealizacionMaterno,
    String? cResultadoMaterno,
    DateTime? cFechaRealizacionMaterno,
    String? auResultadoMaterno,
    DateTime? auFechaRealizacionMaterno,
    String? uResultadoMaterno,
    DateTime? uFechaRealizacionMaterno,
    String? colResultadoMaterno,
    DateTime? colFechaRealizacionMaterno,
    String? tResultadoMaterno,
    DateTime? tFechaRealizacionMaterno,
    String? bResultadoMaterno,
    DateTime? bFechaRealizacionMaterno,
    String? tpgResultadoMaterno,
    DateTime? tpgFechaRealizacionMaterno,
    String? tgoResultadoMaterno,
    DateTime? tgoFechaRealizacionMaterno,
    String? ggtResultadoMaterno,
    DateTime? ggtFechaRealizacionMaterno,
    String? citResultadoMaterno,
    DateTime? citFechaRealizacionMaterno,
    String? uroResultadoMaterno,
    DateTime? uroFechaRealizacionMaterno,
    String? hfResultadoMaterno,
    DateTime? hfFechaRealizacionMaterno,
    String? evsResultadoMaterno,
    DateTime? evsFechaRealizacionMaterno,
    String? evcResultadoMaterno,
    DateTime? evcFechaRealizacionMaterno,
    String? pcsultadoMaterno,
    DateTime? pcFechaRealizacionMaterno,
  }) {
    return LaboratorioMicrobiologiaModel(
      id: id ?? this.id,
      ghResultadoMaterno: ghResultadoMaterno ?? this.ghResultadoMaterno,
      grFechaRealizacionMaterno: grFechaRealizacionMaterno ?? this.grFechaRealizacionMaterno,
      ghResultadoPaterno: ghResultadoPaterno ?? this.ghResultadoPaterno,
      grFechaRealizacionPaterno: grFechaRealizacionPaterno ?? this.grFechaRealizacionPaterno,
      vihResultadoMaterno: vihResultadoMaterno ?? this.vihResultadoMaterno,
      vihFechaRealizacionMaterno: vihFechaRealizacionMaterno ?? this.vihFechaRealizacionMaterno,
      vihResultadoPaterno: vihResultadoPaterno ?? this.vihResultadoPaterno,
      vihFechaRealizacionPaterno: vihFechaRealizacionPaterno ?? this.vihFechaRealizacionPaterno,
      sResultadoMaterno: sResultadoMaterno ?? this.sResultadoMaterno,
      sFechaRealizacionMaterno: sFechaRealizacionMaterno ?? this.sFechaRealizacionMaterno,
      sResultadoPaterno: sResultadoPaterno ?? this.sResultadoPaterno,
      sFechaRealizacionPaterno: sFechaRealizacionPaterno ?? this.sFechaRealizacionPaterno,
      asResultadoMaterno: asResultadoMaterno ?? this.asResultadoMaterno,
      asFechaRealizacionMaterno: asFechaRealizacionMaterno ?? this.asFechaRealizacionMaterno,
      asResultadoPaterno: asResultadoPaterno ?? this.asResultadoPaterno,
      asFechaRealizacionPaterno: asFechaRealizacionPaterno ?? this.asFechaRealizacionPaterno,
      hbResultadoMaterno: hbResultadoMaterno ?? this.hbResultadoMaterno,
      hbFechaRealizacionMaterno: hbFechaRealizacionMaterno ?? this.hbFechaRealizacionMaterno,
      htoResultadoMaterno: htoResultadoMaterno ?? this.htoResultadoMaterno,
      htoFechaRealizacionMaterno: htoFechaRealizacionMaterno ?? this.htoFechaRealizacionMaterno,
      gResultadoMaterno: gResultadoMaterno ?? this.gResultadoMaterno,
      gFechaRealizacionMaterno: gFechaRealizacionMaterno ?? this.gFechaRealizacionMaterno,
      ptgaResultadoMaterno: ptgaResultadoMaterno ?? this.ptgaResultadoMaterno,
      ptgaFechaRealizacionMaterno: ptgaFechaRealizacionMaterno ?? this.ptgaFechaRealizacionMaterno,
      ptg2hResultadoMaterno: ptg2hResultadoMaterno ?? this.ptg2hResultadoMaterno,
      ptg2hFechaRealizacionMaterno: ptg2hFechaRealizacionMaterno ?? this.ptg2hFechaRealizacionMaterno,
      cResultadoMaterno: cResultadoMaterno ?? this.cResultadoMaterno,
      cFechaRealizacionMaterno: cFechaRealizacionMaterno ?? this.cFechaRealizacionMaterno,
      auResultadoMaterno: auResultadoMaterno ?? this.auResultadoMaterno,
      auFechaRealizacionMaterno: auFechaRealizacionMaterno ?? this.auFechaRealizacionMaterno,
      uResultadoMaterno: uResultadoMaterno ?? this.uResultadoMaterno,
      uFechaRealizacionMaterno: uFechaRealizacionMaterno ?? this.uFechaRealizacionMaterno,
      colResultadoMaterno: colResultadoMaterno ?? this.colResultadoMaterno,
      colFechaRealizacionMaterno: colFechaRealizacionMaterno ?? this.colFechaRealizacionMaterno,
      tResultadoMaterno: tResultadoMaterno ?? this.tResultadoMaterno,
      tFechaRealizacionMaterno: tFechaRealizacionMaterno ?? this.tFechaRealizacionMaterno,
      bResultadoMaterno: bResultadoMaterno ?? this.bResultadoMaterno,
      bFechaRealizacionMaterno: bFechaRealizacionMaterno ?? this.bFechaRealizacionMaterno,
      tpgResultadoMaterno: tpgResultadoMaterno ?? this.tpgResultadoMaterno,
      tpgFechaRealizacionMaterno: tpgFechaRealizacionMaterno ?? this.tpgFechaRealizacionMaterno,
      tgoResultadoMaterno: tgoResultadoMaterno ?? this.tgoResultadoMaterno,
      tgoFechaRealizacionMaterno: tgoFechaRealizacionMaterno ?? this.tgoFechaRealizacionMaterno,
      ggtResultadoMaterno: ggtResultadoMaterno ?? this.ggtResultadoMaterno,
      ggtFechaRealizacionMaterno: ggtFechaRealizacionMaterno ?? this.ggtFechaRealizacionMaterno,
      citResultadoMaterno: citResultadoMaterno ?? this.citResultadoMaterno,
      citFechaRealizacionMaterno: citFechaRealizacionMaterno ?? this.citFechaRealizacionMaterno,
      uroResultadoMaterno: uroResultadoMaterno ?? this.uroResultadoMaterno,
      uroFechaRealizacionMaterno: uroFechaRealizacionMaterno ?? this.uroFechaRealizacionMaterno,
      hfResultadoMaterno: hfResultadoMaterno ?? this.hfResultadoMaterno,
      hfFechaRealizacionMaterno: hfFechaRealizacionMaterno ?? this.hfFechaRealizacionMaterno,
      evsResultadoMaterno: evsResultadoMaterno ?? this.evsResultadoMaterno,
      evsFechaRealizacionMaterno: evsFechaRealizacionMaterno ?? this.evsFechaRealizacionMaterno,
      evcResultadoMaterno: evcResultadoMaterno ?? this.evcResultadoMaterno,
      evcFechaRealizacionMaterno: evcFechaRealizacionMaterno ?? this.evcFechaRealizacionMaterno,
      pcsultadoMaterno: pcsultadoMaterno ?? this.pcsultadoMaterno,
      pcFechaRealizacionMaterno: pcFechaRealizacionMaterno ?? this.pcFechaRealizacionMaterno,
    );
  }
}
