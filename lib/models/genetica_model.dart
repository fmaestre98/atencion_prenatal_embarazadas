import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GeneticaModel {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

//datos de genetica
  String? efhb;
  String? afp;

  //ultrasonido 1er trimestre
  DateTime? fechaRealizacion;
  int? numFetos;

  String? datosDeInteres;

  @Backlink('genetica')
  final fetos1erTrimestre = ToMany<FetoUltrasonido1erTrimestre>();

  @Backlink('genetica')
  final fetosSeguimiento = ToMany<FetoUltrasonidoSeguimiento>();

  //ultrasonido de seguimiento
  DateTime? usFechaRealizacion;
  int? usNumFetos;

  //cervicometria
  String? longitudDelCuello;
  String? oci;
  String? valorOci;
  String? maniobrasEsfuerzo;
  String? icc;
  String? iccPercentil;
  String? csDatosDeInteres;

  //doppler arterias uterinas
  String? ip1;
  String? ipD;
  String? ipM;
  String? ipmPercentil;
  String? dusDatosDeInteres;

  //cervicometria de seguimeiento
  DateTime? scfechaRealizacion;
  String? scLongitudCuello;
  String? scOci;
  String? scValorOci;
  String? scManiobrasEsfuerzo;
  String? scIcc;
  String? scIccPercentil;
  String? eg;
  String? scDatosDeInteres;

  GeneticaModel(
      {this.id = 0,
      this.efhb,
      this.afp,
      this.fechaRealizacion,
      this.numFetos,
      this.datosDeInteres,
      this.usFechaRealizacion,
      this.usNumFetos,
      this.longitudDelCuello,
      this.oci,
      this.valorOci,
      this.maniobrasEsfuerzo,
      this.icc,
      this.iccPercentil,
      this.csDatosDeInteres,
      this.ip1,
      this.ipD,
      this.ipM,
      this.ipmPercentil,
      this.dusDatosDeInteres,
      this.scfechaRealizacion,
      this.scLongitudCuello,
      this.scOci,
      this.scValorOci,
      this.scManiobrasEsfuerzo,
      this.scIcc,
      this.scIccPercentil,
      this.eg,
      this.scDatosDeInteres});

  GeneticaModel copyWith({
    int? id,
    String? efhb,
    String? afp,
    DateTime? fechaRealizacion,
    int? numFetos,
    String? datosDeInteres,
    DateTime? usFechaRealizacion,
    int? usNumFetos,
    String? longitudDelCuello,
    String? oci,
    String? valorOci,
    String? maniobrasEsfuerzo,
    String? icc,
    String? iccPercentil,
    String? csDatosDeInteres,
    String? ip1,
    String? ipD,
    String? ipM,
    String? ipmPercentil,
    String? dusDatosDeInteres,
    DateTime? scfechaRealizacion,
    String? scLongitudCuello,
    String? scOci,
    String? scValorOci,
    String? scManiobrasEsfuerzo,
    String? scIcc,
    String? scIccPercentil,
    String? eg,
    String? scDatosDeInteres,
  }) {
    return GeneticaModel(
      id: id ?? this.id,
      efhb: efhb ?? this.efhb,
      afp: afp ?? this.afp,
      fechaRealizacion: fechaRealizacion ?? this.fechaRealizacion,
      numFetos: numFetos ?? this.numFetos,
      datosDeInteres: datosDeInteres ?? this.datosDeInteres,
      usFechaRealizacion: usFechaRealizacion ?? this.usFechaRealizacion,
      usNumFetos: usNumFetos ?? this.usNumFetos,
      longitudDelCuello: longitudDelCuello ?? this.longitudDelCuello,
      oci: oci ?? this.oci,
      valorOci: valorOci ?? this.valorOci,
      maniobrasEsfuerzo: maniobrasEsfuerzo ?? this.maniobrasEsfuerzo,
      icc: icc ?? this.icc,
      iccPercentil: iccPercentil ?? this.iccPercentil,
      csDatosDeInteres: csDatosDeInteres ?? this.csDatosDeInteres,
      ip1: ip1 ?? this.ip1,
      ipD: ipD ?? this.ipD,
      ipM: ipM ?? this.ipM,
      ipmPercentil: ipmPercentil ?? this.ipmPercentil,
      dusDatosDeInteres: dusDatosDeInteres ?? this.dusDatosDeInteres,
      scfechaRealizacion: scfechaRealizacion ?? this.scfechaRealizacion,
      scLongitudCuello: scLongitudCuello ?? this.scLongitudCuello,
      scOci: scOci ?? this.scOci,
      scValorOci: scValorOci ?? this.scValorOci,
      scManiobrasEsfuerzo: scManiobrasEsfuerzo ?? this.scManiobrasEsfuerzo,
      scIcc: scIcc ?? this.scIcc,
      scIccPercentil: scIccPercentil ?? this.scIccPercentil,
      eg: eg ?? this.eg,
      scDatosDeInteres: scDatosDeInteres ?? this.scDatosDeInteres,
    );
  }
}

@Entity()
class FetoUltrasonido1erTrimestre {
  int id; // field auto-incremented
  String? lc;
  String? corion;
  String? lcr;
  String? dbp;
  String? tn;
  String? hn;
  String? cristalinos;
  String? estomago;
  String? paa;
  String? cuatroMiembros;
  String? eg;

  //ducto venoso
  String? ip;
  String? ipPercentil;
  String? onda;

  final genetica = ToOne<GeneticaModel>();

  FetoUltrasonido1erTrimestre(
      {this.id = 0,
      this.lc,
      this.corion,
      this.lcr,
      this.dbp,
      this.tn,
      this.hn,
      this.cristalinos,
      this.estomago,
      this.paa,
      this.cuatroMiembros,
      this.eg,
      this.ip,
      this.ipPercentil,
      this.onda});

  FetoUltrasonido1erTrimestre copyWith({
    int? id,
    String? lc,
    String? corion,
    String? lcr,
    String? dbp,
    String? tn,
    String? hn,
    String? cristalinos,
    String? estomago,
    String? paa,
    String? cuatroMiembros,
    String? eg,
    String? ip,
    String? ipPercentil,
    String? onda,
  }) {
    return FetoUltrasonido1erTrimestre(
      id: id ?? this.id,
      lc: lc ?? this.lc,
      corion: corion ?? this.corion,
      lcr: lcr ?? this.lcr,
      dbp: dbp ?? this.dbp,
      tn: tn ?? this.tn,
      hn: hn ?? this.hn,
      cristalinos: cristalinos ?? this.cristalinos,
      estomago: estomago ?? this.estomago,
      paa: paa ?? this.paa,
      cuatroMiembros: cuatroMiembros ?? this.cuatroMiembros,
      eg: eg ?? this.eg,
      ip: ip ?? this.ip,
      ipPercentil: ipPercentil ?? this.ipPercentil,
      onda: onda ?? this.onda,
    );
  }
}

@Entity()
class FetoUltrasonidoSeguimiento {
  int id; // field auto-incremented
  String? lc;
  String? cc;
  String? ca;
  String? lf;
  String? ila;
  String? ts;
  String? threeVasos;
  String? la;

  //placenta
  String? pocision;
  String? signosDeAcretismo;
  String? variedadDeAcretismo;
  String? madurezPlacentaria;

  //otros
  String? vejiga;
  String? estomago;
  String? columna;
  String? riniones;
  String? macisoFacial;
  String? fourMiembros;
  String? paa;

  //estructuras cerebrales
  String? pliegueNucal;
  String? fosaPosteriol;
  String? atrioVentricular;
  String? cerebelo;

  //otros
  String? cordon3Vasos;
  String? eg;
  String? pf;
  String? pfPercentil;
  String? datosDeInteres;

  final genetica = ToOne<GeneticaModel>();

  FetoUltrasonidoSeguimiento(
      {this.id = 0,
      this.lc,
      this.cc,
      this.ca,
      this.lf,
      this.ila,
      this.ts,
      this.threeVasos,
      this.la,
      this.pocision,
      this.signosDeAcretismo,
      this.variedadDeAcretismo,
      this.madurezPlacentaria,
      this.vejiga,
      this.estomago,
      this.columna,
      this.riniones,
      this.macisoFacial,
      this.fourMiembros,
      this.paa,
      this.pliegueNucal,
      this.fosaPosteriol,
      this.atrioVentricular,
      this.cerebelo,
      this.cordon3Vasos,
      this.eg,
      this.pf,
      this.pfPercentil,
      this.datosDeInteres});

  FetoUltrasonidoSeguimiento copyWith({
    int? id,
    String? lc,
    String? cc,
    String? ca,
    String? lf,
    String? ila,
    String? ts,
    String? threeVasos,
    String? la,
    String? pocision,
    String? signosDeAcretismo,
    String? variedadDeAcretismo,
    String? madurezPlacentaria,
    String? vejiga,
    String? estomago,
    String? columna,
    String? riniones,
    String? macisoFacial,
    String? fourMiembros,
    String? paa,
    String? pliegueNucal,
    String? fosaPosteriol,
    String? atrioVentricular,
    String? cerebelo,
    String? cordon3Vasos,
    String? eg,
    String? pf,
    String? pfPercentil,
    String? datosDeInteres,
  }) {
    return FetoUltrasonidoSeguimiento(
      id: id ?? this.id,
      lc: lc ?? this.lc,
      cc: cc ?? this.cc,
      ca: ca ?? this.ca,
      lf: lf ?? this.lf,
      ila: ila ?? this.ila,
      ts: ts ?? this.ts,
      threeVasos: threeVasos ?? this.threeVasos,
      la: la ?? this.la,
      pocision: pocision ?? this.pocision,
      signosDeAcretismo: signosDeAcretismo ?? this.signosDeAcretismo,
      variedadDeAcretismo: variedadDeAcretismo ?? this.variedadDeAcretismo,
      madurezPlacentaria: madurezPlacentaria ?? this.madurezPlacentaria,
      vejiga: vejiga ?? this.vejiga,
      estomago: estomago ?? this.estomago,
      columna: columna ?? this.columna,
      riniones: riniones ?? this.riniones,
      macisoFacial: macisoFacial ?? this.macisoFacial,
      fourMiembros: fourMiembros ?? this.fourMiembros,
      paa: paa ?? this.paa,
      pliegueNucal: pliegueNucal ?? this.pliegueNucal,
      fosaPosteriol: fosaPosteriol ?? this.fosaPosteriol,
      atrioVentricular: atrioVentricular ?? this.atrioVentricular,
      cerebelo: cerebelo ?? this.cerebelo,
      cordon3Vasos: cordon3Vasos ?? this.cordon3Vasos,
      eg: eg ?? this.eg,
      pf: pf ?? this.pf,
      pfPercentil: pfPercentil ?? this.pfPercentil,
      datosDeInteres: datosDeInteres ?? this.datosDeInteres,
    );
  }
}
