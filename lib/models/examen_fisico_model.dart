import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ExamenFisicoModel {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

//examen obstetrico
  String? semanasDeGestacion;
  String? peso;
  String? alturaUterina;
  String? circunsferenciaAbdominal;
  String? presentacion;
  String? posicion;
  String? focoFetal;
  String? movimientoFetal;
  String? tonoUterino;
  String? edemas;
  String? dinamicaUterina;

  //general
  String? tejidoCelularSubcutaneo;
  String? facies;
  String? piel;
  String? gObservacions;
  String? mucosas;
  String? faneras;

  //respiratorio
  String? rInspeccion;
  String? rPalpacion;
  String? rPercucion;
  String? rAuscultacion;
  String? rObservacions;

  //area cardiaca
  String? acInspeccion;
  String? acPalpacion;
  String? acAuscultacion;
  String? acObservacions;

  //venoso linfatico
  String? venosoPeriferico;
  String? linfatico;
  String? vlObservacions;

  //digestivo superior
  String? boca;
  String? lengua;
  String? orofaringe;
  String? dsObservacions;

  //abdomen
  String? aInspeccion;
  String? aPalpacion;
  String? aPercucion;
  String? aAuscultacion;
  String? aTactoRectal;
  String? aObservacions;

  //urinario
  String? uInspeccion;
  String? uPalpacion;
  String? uPercucion;
  String? uObservacions;

  //Vuelva y Perina
  String? vuelvaPerine;
  String? vObservaciones;

  //Vagina
  String? vagina;
  String? vagObservaciones;

  //Cuello
  String? cuello;
  String? cObservaciones;

  //utero
  String? utero;
  String? utObservaciones;

  //Anejos
  String? anejos;
  String? anObservaciones;

  //Mamas
  String? mInspeccion;
  String? mPalpacion;
  bool? aptasLaptar;
  String? mObservaciones;

  ExamenFisicoModel(
      {this.id = 0,
      this.semanasDeGestacion,
      this.peso,
      this.alturaUterina,
      this.circunsferenciaAbdominal,
      this.presentacion = "Cefálico",
      this.posicion = "Dorso izquierdo",
      this.focoFetal = "Presente",
      this.movimientoFetal,
      this.tonoUterino = "Normal",
      this.edemas,
      this.dinamicaUterina,
      this.tejidoCelularSubcutaneo,
      this.facies,
      this.piel,
      this.gObservacions,
      this.mucosas,
      this.faneras,
      this.rInspeccion,
      this.rPalpacion,
      this.rPercucion,
      this.rAuscultacion,
      this.rObservacions,
      this.acInspeccion,
      this.acPalpacion,
      this.acAuscultacion,
      this.acObservacions,
      this.venosoPeriferico,
      this.linfatico,
      this.vlObservacions,
      this.boca,
      this.lengua,
      this.orofaringe,
      this.dsObservacions,
      this.aInspeccion,
      this.aPalpacion,
      this.aPercucion,
      this.aAuscultacion,
      this.aTactoRectal,
      this.aObservacions,
      this.uInspeccion,
      this.uPalpacion,
      this.uPercucion,
      this.uObservacions,
      this.vuelvaPerine,
      this.vObservaciones,
      this.vagina,
      this.vagObservaciones,
      this.cuello,
      this.cObservaciones,
      this.utero,
      this.utObservaciones,
      this.anejos,
      this.anObservaciones,
      this.mInspeccion,
      this.mPalpacion,
      this.aptasLaptar,
      this.mObservaciones});

  ExamenFisicoModel copyWith({
    int? id,
    String? semanasDeGestacion,
    String? peso,
    String? alturaUterina,
    String? circunsferenciaAbdominal,
    String? presentacion,
    String? posicion,
    String? focoFetal,
    String? movimientoFetal,
    String? tonoUterino,
    String? edemas,
    String? dinamicaUterina,
    String? tejidoCelularSubcutaneo,
    String? facies,
    String? piel,
    String? gObservacions,
    String? mucosas,
    String? faneras,
    String? rInspeccion,
    String? rPalpacion,
    String? rPercucion,
    String? rAuscultacion,
    String? rObservacions,
    String? acInspeccion,
    String? acPalpacion,
    String? acAuscultacion,
    String? acObservacions,
    String? venosoPeriferico,
    String? linfatico,
    String? vlObservacions,
    String? boca,
    String? lengua,
    String? orofaringe,
    String? dsObservacions,
    String? aInspeccion,
    String? aPalpacion,
    String? aPercucion,
    String? aAuscultacion,
    String? aTactoRectal,
    String? aObservacions,
    String? uInspeccion,
    String? uPalpacion,
    String? uPercucion,
    String? uObservacions,
    String? vuelvaPerine,
    String? vObservaciones,
    String? vagina,
    String? vagObservaciones,
    String? cuello,
    String? cObservaciones,
    String? utero,
    String? utObservaciones,
    String? anejos,
    String? anObservaciones,
    String? mInspeccion,
    String? mPalpacion,
    bool? aptasLaptar,
    String? mObservaciones,
  }) {
    return ExamenFisicoModel(
      id: id ?? this.id,
      semanasDeGestacion: semanasDeGestacion ?? this.semanasDeGestacion,
      peso: peso ?? this.peso,
      alturaUterina: alturaUterina ?? this.alturaUterina,
      circunsferenciaAbdominal:
          circunsferenciaAbdominal ?? this.circunsferenciaAbdominal,
      presentacion: presentacion ?? this.presentacion,
      posicion: posicion ?? this.posicion,
      focoFetal: focoFetal ?? this.focoFetal,
      movimientoFetal: movimientoFetal ?? this.movimientoFetal,
      tonoUterino: tonoUterino ?? this.tonoUterino,
      edemas: edemas ?? this.edemas,
      dinamicaUterina: dinamicaUterina ?? this.dinamicaUterina,
      tejidoCelularSubcutaneo:
          tejidoCelularSubcutaneo ?? this.tejidoCelularSubcutaneo,
      facies: facies ?? this.facies,
      piel: piel ?? this.piel,
      gObservacions: gObservacions ?? this.gObservacions,
      mucosas: mucosas ?? this.mucosas,
      faneras: faneras ?? this.faneras,
      rInspeccion: rInspeccion ?? this.rInspeccion,
      rPalpacion: rPalpacion ?? this.rPalpacion,
      rPercucion: rPercucion ?? this.rPercucion,
      rAuscultacion: rAuscultacion ?? this.rAuscultacion,
      rObservacions: rObservacions ?? this.rObservacions,
      acInspeccion: acInspeccion ?? this.acInspeccion,
      acPalpacion: acPalpacion ?? this.acPalpacion,
      acAuscultacion: acAuscultacion ?? this.acAuscultacion,
      acObservacions: acObservacions ?? this.acObservacions,
      venosoPeriferico: venosoPeriferico ?? this.venosoPeriferico,
      linfatico: linfatico ?? this.linfatico,
      vlObservacions: vlObservacions ?? this.vlObservacions,
      boca: boca ?? this.boca,
      lengua: lengua ?? this.lengua,
      orofaringe: orofaringe ?? this.orofaringe,
      dsObservacions: dsObservacions ?? this.dsObservacions,
      aInspeccion: aInspeccion ?? this.aInspeccion,
      aPalpacion: aPalpacion ?? this.aPalpacion,
      aPercucion: aPercucion ?? this.aPercucion,
      aAuscultacion: aAuscultacion ?? this.aAuscultacion,
      aTactoRectal: aTactoRectal ?? this.aTactoRectal,
      aObservacions: aObservacions ?? this.aObservacions,
      uInspeccion: uInspeccion ?? this.uInspeccion,
      uPalpacion: uPalpacion ?? this.uPalpacion,
      uPercucion: uPercucion ?? this.uPercucion,
      uObservacions: uObservacions ?? this.uObservacions,
      vuelvaPerine: vuelvaPerine ?? this.vuelvaPerine,
      vObservaciones: vObservaciones ?? this.vObservaciones,
      vagina: vagina ?? this.vagina,
      vagObservaciones: vagObservaciones ?? this.vagObservaciones,
      cuello: cuello ?? this.cuello,
      cObservaciones: cObservaciones ?? this.cObservaciones,
      utero: utero ?? this.utero,
      utObservaciones: utObservaciones ?? this.utObservaciones,
      anejos: anejos ?? this.anejos,
      anObservaciones: anObservaciones ?? this.anObservaciones,
      mInspeccion: mInspeccion ?? this.mInspeccion,
      mPalpacion: mPalpacion ?? this.mPalpacion,
      aptasLaptar: aptasLaptar ?? this.aptasLaptar,
      mObservaciones: mObservaciones ?? this.mObservaciones,
    );
  }
}
