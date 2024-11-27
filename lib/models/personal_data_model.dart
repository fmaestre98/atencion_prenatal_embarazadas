import 'package:atencion_prenatal_embarazadas/models/examen_fisico_model.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interconsultas_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interrogatory_model.dart';
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:atencion_prenatal_embarazadas/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Paciente {
  int id; // field auto-incremented
  String? nombre;
  String? primerApellido;
  String? segundoApellido;
  @Property(type: PropertyType.date)
  DateTime? fechaNacimiento;
  String? sexo;
  String? direccion;
  String? tipoDePaciente;
  String? noIdentidad;
  int? edad;
  String? aboRh;
  String? unidadHospitalaria;
  String? policlinico;
  String? estadoCivil;
  String? escolaridad;
  String? consultorio;
  String? ocupacion;
  @Property(type: PropertyType.date)
  DateTime? fechaDeRegistro;
  @Property(type: PropertyType.date)
  DateTime? fechaDeActualizacion;

  //vivienda
  int? noDormitorios;
  int? noPersonasNucleoPersonal;

  String? tipoDeRiesgo;
  String? datosDeInteres;

  //diagnostico
  String? tipoDeDiagnostico;
  String? codigo;
  String? descripcion;
  String? estructura;
  String? conductaSeguida;

  final antecedentesPatologicasPersonales =
      ToOne<AntecedentesPatologicosPersonales>();

  final antecedentesGinecologicos = ToOne<AntecedentesGinecologicos>();

  final antecedentesObstetricos = ToOne<AntecedentesObstetricos>();

  final embarazoActual = ToOne<EmbarazoActual>();

  final interrogatorio = ToOne<Interrogatorio>();

  final signosVitales = ToOne<SignosVitalesModel>();

  final examenFisico = ToOne<ExamenFisicoModel>();

  final interconsultas = ToOne<InterconsultasModel>();

  final genetica = ToOne<GeneticaModel>();

  final laboratorio = ToOne<LaboratorioMicrobiologiaModel>();

  String? traumatismoAccidentes;

  Paciente({
    this.id = 0,
    this.nombre,
    this.primerApellido,
    this.segundoApellido,
    this.fechaNacimiento,
    this.sexo="Femenino",
    this.direccion,
    this.tipoDePaciente="Nacional",
    this.noIdentidad,
    this.aboRh,
    this.unidadHospitalaria,
    this.policlinico,
    this.estadoCivil="Casado",
    this.escolaridad="Ninguno",
    this.consultorio,
    this.ocupacion,
    this.noDormitorios,
    this.noPersonasNucleoPersonal,
    this.codigo,
    this.datosDeInteres,
    this.descripcion,
    this.estructura,
    this.tipoDeDiagnostico,
    this.tipoDeRiesgo,
    this.conductaSeguida,
    this.fechaDeRegistro,
    this.fechaDeActualizacion,
    this.edad,
    this.traumatismoAccidentes,
  });

  Paciente copyWith({
    int? id,
    String? nombre,
    String? primerApellido,
    String? segundoApellido,
    DateTime? fechaNacimiento,
    String? sexo,
    String? direccion,
    String? tipoDePaciente,
    String? noIdentidad,
    int? edad,
    String? aboRh,
    String? unidadHospitalaria,
    String? policlinico,
    String? estadoCivil,
    String? escolaridad,
    String? consultorio,
    String? ocupacion,
    DateTime? fechaDeRegistro,
    DateTime? fechaDeActualizacion,
    int? noDormitorios,
    int? noPersonasNucleoPersonal,
    String? tipoDeRiesgo,
    String? datosDeInteres,
    String? tipoDeDiagnostico,
    String? codigo,
    String? descripcion,
    String? estructura,
    String? conductaSeguida,
    String? traumatismoAccidentes,
  }) {
    return Paciente(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      primerApellido: primerApellido ?? this.primerApellido,
      segundoApellido: segundoApellido ?? this.segundoApellido,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      sexo: sexo ?? this.sexo,
      direccion: direccion ?? this.direccion,
      tipoDePaciente: tipoDePaciente ?? this.tipoDePaciente,
      noIdentidad: noIdentidad ?? this.noIdentidad,
      edad: edad ?? this.edad,
      aboRh: aboRh ?? this.aboRh,
      unidadHospitalaria: unidadHospitalaria ?? this.unidadHospitalaria,
      policlinico: policlinico ?? this.policlinico,
      estadoCivil: estadoCivil ?? this.estadoCivil,
      escolaridad: escolaridad ?? this.escolaridad,
      consultorio: consultorio ?? this.consultorio,
      ocupacion: ocupacion ?? this.ocupacion,
      fechaDeRegistro: fechaDeRegistro ?? this.fechaDeRegistro,
      fechaDeActualizacion: fechaDeActualizacion ?? this.fechaDeActualizacion,
      noDormitorios: noDormitorios ?? this.noDormitorios,
      noPersonasNucleoPersonal:
          noPersonasNucleoPersonal ?? this.noPersonasNucleoPersonal,
      tipoDeRiesgo: tipoDeRiesgo ?? this.tipoDeRiesgo,
      datosDeInteres: datosDeInteres ?? this.datosDeInteres,
      tipoDeDiagnostico: tipoDeDiagnostico ?? this.tipoDeDiagnostico,
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
      estructura: estructura ?? this.estructura,
      conductaSeguida: conductaSeguida ?? this.conductaSeguida,
      traumatismoAccidentes:
          traumatismoAccidentes ?? this.traumatismoAccidentes,
    );
  }
}

@Entity()
class EmbarazoActual {
  int id; // field auto-incremented
  @Property(type: PropertyType.date)
  DateTime? fechaUltimaMenstruacion;

  //fechaUltimaMenstruacion
  bool noConfiable;
  bool desconocida;

  @Property(type: PropertyType.date)
  DateTime? fechaPartoEstimado;

  int? captacion;
  int? semanas;

  final paciente = ToOne<Paciente>();

  EmbarazoActual(
      {this.id = 0,
      this.fechaUltimaMenstruacion,
      this.noConfiable = false,
      this.desconocida = false,
      this.fechaPartoEstimado,
      this.captacion,
      this.semanas});

  EmbarazoActual copyWith({
    int? id,
    DateTime? fechaUltimaMenstruacion,
    bool? noConfiable,
    bool? desconocida,
    DateTime? fechaPartoEstimado,
    int? captacion,
    int? semanas,
  }) {
    return EmbarazoActual(
      fechaUltimaMenstruacion:
          fechaUltimaMenstruacion ?? this.fechaUltimaMenstruacion,
      noConfiable: noConfiable ?? this.noConfiable,
      desconocida: desconocida ?? this.desconocida,
      fechaPartoEstimado: fechaPartoEstimado ?? this.fechaPartoEstimado,
      captacion: captacion ?? this.captacion,
      semanas: semanas ?? this.semanas,
      id: id ?? this.id,
    );
  }
}

@Entity()
class AntecedentesPatologicosPersonales {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  String? enfermedadesGenerales;
  String? enfermedadesEndocrinas;
  String? enfermedadesRespiratorias;
  String? enfermedadesCardiovasculares;
  String? enfermedadesDigestivas;
  String? enfermedadesRenales;
  String? enfermedadesNeuronales;
  String? enfermedadesHematologicas;
  String? enfermedadesReumatologicas;
  String? enfermedadesTransmisionSexual;
  String? enfermedadesGinecologicas;

  String? antecedentesFamiliares;
  String? antecedentesQuirugicos;
  String? habitosPsicobiologicos;
  String? transfusionesPrevias;
  String? inmunizaciones;

  AntecedentesPatologicosPersonales({
    this.id = 0,
    this.enfermedadesGenerales,
    this.enfermedadesEndocrinas,
    this.enfermedadesRespiratorias,
    this.enfermedadesCardiovasculares,
    this.enfermedadesDigestivas,
    this.enfermedadesRenales,
    this.enfermedadesNeuronales,
    this.enfermedadesHematologicas,
    this.enfermedadesReumatologicas,
    this.enfermedadesTransmisionSexual,
    this.enfermedadesGinecologicas,
    this.antecedentesFamiliares,
    this.antecedentesQuirugicos,
    this.habitosPsicobiologicos,
    this.transfusionesPrevias,
    this.inmunizaciones,
  });

  AntecedentesPatologicosPersonales copyWith({
    int? id,
    String? enfermedadesGenerales,
    String? enfermedadesEndocrinas,
    String? enfermedadesRespiratorias,
    String? enfermedadesCardiovasculares,
    String? enfermedadesDigestivas,
    String? enfermedadesRenales,
    String? enfermedadesNeuronales,
    String? enfermedadesHematologicas,
    String? enfermedadesReumatologicas,
    String? enfermedadesTransmisionSexual,
    String? enfermedadesGinecologicas,
    String? antecedentesFamiliares,
    String? antecedentesQuirugicos,
    String? habitosPsicobiologicos,
    String? transfusionesPrevias,
    String? inmunizaciones,
  }) {
    return AntecedentesPatologicosPersonales(
      id: id ?? this.id,
      enfermedadesGenerales:
          enfermedadesGenerales ?? this.enfermedadesGenerales,
      enfermedadesEndocrinas:
          enfermedadesEndocrinas ?? this.enfermedadesEndocrinas,
      enfermedadesRespiratorias:
          enfermedadesRespiratorias ?? this.enfermedadesRespiratorias,
      enfermedadesCardiovasculares:
          enfermedadesCardiovasculares ?? this.enfermedadesCardiovasculares,
      enfermedadesDigestivas:
          enfermedadesDigestivas ?? this.enfermedadesDigestivas,
      enfermedadesRenales: enfermedadesRenales ?? this.enfermedadesRenales,
      enfermedadesNeuronales:
          enfermedadesNeuronales ?? this.enfermedadesNeuronales,
      enfermedadesHematologicas:
          enfermedadesHematologicas ?? this.enfermedadesHematologicas,
      enfermedadesReumatologicas:
          enfermedadesReumatologicas ?? this.enfermedadesReumatologicas,
      enfermedadesTransmisionSexual:
          enfermedadesTransmisionSexual ?? this.enfermedadesTransmisionSexual,
      enfermedadesGinecologicas:
          enfermedadesGinecologicas ?? this.enfermedadesGinecologicas,
      antecedentesFamiliares:
          antecedentesFamiliares ?? this.antecedentesFamiliares,
      antecedentesQuirugicos:
          antecedentesQuirugicos ?? this.antecedentesQuirugicos,
      habitosPsicobiologicos:
          habitosPsicobiologicos ?? this.habitosPsicobiologicos,
      transfusionesPrevias: transfusionesPrevias ?? this.transfusionesPrevias,
      inmunizaciones: inmunizaciones ?? this.inmunizaciones,
    );
  }
}

@Entity()
class AntecedentesGinecologicos {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  // Campos para antecedentes ginecológicos
  int? edadMenopausia; // Edad de la menopausia
  String? caracteristicasMenopausia; // Características de la menopausia
  int? edadMenarquia; // Edad de la menarquía
  String? caracteristicasMenarquia;
  int? edadPrimeraRelacion; // Edad de la primera relación sexual
  String? formulaMenstrual; // Fórmula menstrual
  @Property(type: PropertyType.date)
  DateTime? fechaUltimaMenstruacion; // Fecha de la última menstruación
  String? tipoMenstruacion; // Tipo de menstruación (regular, irregular, etc.)

  // Métodos anticonceptivos
  @Property(type: PropertyType.date)
  DateTime? fechaUltimoUso; // Fecha del último uso
  String? descripcion; // Descripción adicional
  bool? barrera;
  bool? diu;
  bool? hormonales;
  String? observacionesAnticonceptivos;

  @Property(type: PropertyType.date)
  DateTime? fechaPruebaCitologica; // Fecha de la prueba citológica
  String? resultadoPruebaCitologica; // Resultado de la prueba (normal, anormal)
  bool? fueraDeProgramaPruebaCitologica; // Indica si es fuera de programa
  String? observacionesPruebaCitologica;

  AntecedentesGinecologicos(
      {this.id = 0,
      this.edadMenopausia,
      this.caracteristicasMenopausia,
      this.edadMenarquia,
      this.caracteristicasMenarquia,
      this.edadPrimeraRelacion,
      this.formulaMenstrual,
      this.fechaUltimaMenstruacion,
      this.tipoMenstruacion="Regular",
      this.fechaUltimoUso,
      this.descripcion,
      this.barrera,
      this.diu,
      this.hormonales,
      this.fechaPruebaCitologica,
      this.resultadoPruebaCitologica="Negativa",
      this.fueraDeProgramaPruebaCitologica,
      this.observacionesPruebaCitologica,
      this.observacionesAnticonceptivos,});

  AntecedentesGinecologicos copyWith({
    int? id,
    int? edadMenopausia,
    String? caracteristicasMenopausia,
    int? edadMenarquia,
    String? caracteristicasMenarquia,
    int? edadPrimeraRelacion,
    String? formulaMenstrual,
    DateTime? fechaUltimaMenstruacion,
    String? tipoMenstruacion,
    DateTime? fechaUltimoUso,
    String? descripcion,
    bool? barrera,
    bool? diu,
    bool? hormonales,
    DateTime? fechaPruebaCitologica,
    String? resultadoPruebaCitologica,
    bool? fueraDeProgramaPruebaCitologica,
    String? observacionesPruebaCitologica,
    String? observacionesAnticonceptivos,
  }) {
    return AntecedentesGinecologicos(
      id: id ?? this.id,
      edadMenopausia: edadMenopausia ?? this.edadMenopausia,
      caracteristicasMenopausia:
          caracteristicasMenopausia ?? this.caracteristicasMenopausia,
      edadMenarquia: edadMenarquia ?? this.edadMenarquia,
      caracteristicasMenarquia:
          caracteristicasMenarquia ?? this.caracteristicasMenarquia,
      edadPrimeraRelacion: edadPrimeraRelacion ?? this.edadPrimeraRelacion,
      formulaMenstrual: formulaMenstrual ?? this.formulaMenstrual,
      fechaUltimaMenstruacion:
          fechaUltimaMenstruacion ?? this.fechaUltimaMenstruacion,
      tipoMenstruacion: tipoMenstruacion ?? this.tipoMenstruacion,
      fechaUltimoUso: fechaUltimoUso ?? this.fechaUltimoUso,
      descripcion: descripcion ?? this.descripcion,
      barrera: barrera ?? this.barrera,
      diu: diu ?? this.diu,
      hormonales: hormonales ?? this.hormonales,
      fechaPruebaCitologica:
          fechaPruebaCitologica ?? this.fechaPruebaCitologica,
      resultadoPruebaCitologica:
          resultadoPruebaCitologica ?? this.resultadoPruebaCitologica,
      fueraDeProgramaPruebaCitologica: fueraDeProgramaPruebaCitologica ??
          this.fueraDeProgramaPruebaCitologica,
      observacionesPruebaCitologica:
          observacionesPruebaCitologica ?? this.observacionesPruebaCitologica,
      observacionesAnticonceptivos: observacionesAnticonceptivos ?? this.observacionesAnticonceptivos,
    );
  }
}

@Entity()
class AntecedentesObstetricos {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  @Backlink('antecedente')
  final embarazos = ToMany<Embarazo>(); // Relación uno a muchos con Embarazo

  AntecedentesObstetricos({this.id = 0});
}

@Entity()
class Embarazo {
  int id; // field auto-incremented
  int? numeroEmbarazo; // Número de embarazo
  @Property(type: PropertyType.date)
  DateTime? fecha; // Fecha del embarazo
  int? semanasGestacion; // Semanas de gestación
  String? tipoParto; // Tipo de parto (natural, cesárea, etc.)
  String? tipoDistocia; // Tipo de distocia (si aplica)
  String? tipoNacimiento;
  String? lugarParto; // Lugar del parto
  String? patologiasAsociadas;

  //aborto
  String? tipoAborto;
  String? tipoProvocado;
  String? observacionesAborto;

  @Backlink("embarazo")
  final recienNacidos =
      ToMany<RecienNacido>(); // Relación uno a muchos con ReciénNacido

  final antecedente = ToOne<AntecedentesObstetricos>();

  Embarazo({
    this.id = 0,
    this.numeroEmbarazo,
    this.fecha,
    this.semanasGestacion,
    this.tipoParto,
    this.tipoDistocia,
    this.lugarParto,
    this.patologiasAsociadas,
    this.tipoAborto,
    this.tipoProvocado,
    this.observacionesAborto,
    this.tipoNacimiento,
  });

  Embarazo copyWith({
    int? id,
    int? numeroEmbarazo,
    DateTime? fecha,
    int? semanasGestacion,
    String? tipoParto,
    String? tipoDistocia,
    String? lugarParto,
    String? patologiasAsociadas,
    String? tipoAborto,
    String? tipoProvocado,
    String? observacionesAborto,
    String? tipoNacimiento,
  }) {
    return Embarazo(
      id: id ?? this.id,
      numeroEmbarazo: numeroEmbarazo ?? this.numeroEmbarazo,
      fecha: fecha ?? this.fecha,
      semanasGestacion: semanasGestacion ?? this.semanasGestacion,
      tipoParto: tipoParto ?? this.tipoParto,
      tipoDistocia: tipoDistocia ?? this.tipoDistocia,
      lugarParto: lugarParto ?? this.lugarParto,
      patologiasAsociadas: patologiasAsociadas ?? this.patologiasAsociadas,
      tipoAborto: tipoAborto ?? this.tipoAborto,
      tipoProvocado: tipoProvocado ?? this.tipoProvocado,
      observacionesAborto: observacionesAborto ?? this.observacionesAborto,
      tipoNacimiento: tipoNacimiento ?? this.tipoNacimiento,
    );
  }
}

@Entity()
class RecienNacido {
  int id; // field auto-incremented
  double? peso; // Peso del recién nacido
  String? sexo; // Sexo del recién nacido
  String? estado; // Estado del recién nacido (vivo, prematuro, etc.)
  String? datosInteres; // Datos de interés adicionales
  int? apgar; // Puntuación de Apgar
  int? puntos; // Puntos (sistema de puntuación adicional)
  String? ocurrenciaDefuncion;
  String? edadAlFallecer;

  final embarazo = ToOne<Embarazo>();

  RecienNacido(
      {this.id = 0,
      this.peso,
      this.sexo,
      this.estado,
      this.datosInteres,
      this.apgar,
      this.puntos,
      this.ocurrenciaDefuncion,
      this.edadAlFallecer});

  RecienNacido copyWith({
    int? id,
    double? peso,
    String? sexo,
    String? estado,
    String? datosInteres,
    int? apgar,
    int? puntos,
    String? ocurrenciaDefuncion,
    String? edadAlFallecer,
  }) {
    return RecienNacido(
      id: id ?? this.id,
      peso: peso ?? this.peso,
      sexo: sexo ?? this.sexo,
      estado: estado ?? this.estado,
      datosInteres: datosInteres ?? this.datosInteres,
      apgar: apgar ?? this.apgar,
      puntos: puntos ?? this.puntos,
      ocurrenciaDefuncion: ocurrenciaDefuncion ?? this.ocurrenciaDefuncion,
      edadAlFallecer: edadAlFallecer ?? this.edadAlFallecer,
    );
  }
}
