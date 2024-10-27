import 'package:atencion_prenatal_embarazadas/models/examen_fisico_model.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interconsultas_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interrogatory_model.dart';
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
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

  @Backlink('paciente')
  final antecedentes = ToMany<Antecedente>();

  final antecedentesPatologicos = ToOne<AntecedentesPatologicosPersonales>();

  final antecedentesObstetricos = ToOne<AntecedentesObstetricos>();

  final embarazoActual = ToOne<EmbarazoActual>();

  final interrogatorio = ToOne<Interrogatorio>();

  final signosVitales = ToOne<SignosVitalesModel>();

  final examenFisico = ToOne<ExamenFisicoModel>();

  final interconsultas = ToOne<InterconsultasModel>();

  final genetica = ToOne<GeneticaModel>();

  final laboratorio = ToOne<LaboratorioMicrobiologiaModel>();

  Paciente({
    this.id = 0,
    this.nombre,
    this.primerApellido,
    this.segundoApellido,
    this.fechaNacimiento,
    this.sexo,
    this.direccion,
    this.tipoDePaciente,
    this.noIdentidad,
    this.aboRh,
    this.unidadHospitalaria,
    this.policlinico,
    this.estadoCivil,
    this.escolaridad,
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
      noPersonasNucleoPersonal: noPersonasNucleoPersonal ?? this.noPersonasNucleoPersonal,
      tipoDeRiesgo: tipoDeRiesgo ?? this.tipoDeRiesgo,
      datosDeInteres: datosDeInteres ?? this.datosDeInteres,
      tipoDeDiagnostico: tipoDeDiagnostico ?? this.tipoDeDiagnostico,
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
      estructura: estructura ?? this.estructura,
      conductaSeguida: conductaSeguida ?? this.conductaSeguida,
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

  EmbarazoActual({this.id = 0, this.fechaUltimaMenstruacion, this.noConfiable = false,
      this.desconocida = false, this.fechaPartoEstimado, this.captacion, this.semanas});

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
      fechaUltimaMenstruacion: fechaUltimaMenstruacion ?? this.fechaUltimaMenstruacion,
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
class Antecedente {
  int id; // field auto-incremented
  String tipo; // Puede ser 'personal', 'familiar', etc.
  String descripcion;
  @Property(type: PropertyType.date)
  DateTime? fecha;

  final paciente = ToOne<Paciente>();

  // Constructor
  Antecedente(this.tipo, this.descripcion, this.fecha, {this.id = 0});
}

@Entity()
class AntecedentesPatologicosPersonales {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  // Relación uno a muchos con Enfermedad
  final enfermedadesGenerales = ToMany<Enfermedad>();
  final enfermedadesEndocrinas = ToMany<Enfermedad>();
  final enfermedadesRespiratorias = ToMany<Enfermedad>();
  final enfermedadesCardiovasculares = ToMany<Enfermedad>();
  final enfermedadesDigestivas = ToMany<Enfermedad>();
  final enfermedadesRenales = ToMany<Enfermedad>();
  final enfermedadesNeuronales = ToMany<Enfermedad>();
  final enfermedadesHematologicas = ToMany<Enfermedad>();
  final enfermedadesReumatologicas = ToMany<Enfermedad>();
  final enfermedadesTransmisionSexual = ToMany<Enfermedad>();
  final enfermedadesGinecologicas = ToMany<Enfermedad>();

  AntecedentesPatologicosPersonales({this.id = 0});
}

@Entity()
class Enfermedad {
  int id; // field auto-incremented
  String nombre; // Nombre de la enfermedad
  bool cronica; // Indica si es crónica
  @Property(type: PropertyType.date)
  DateTime? fecha; // Fecha de diagnóstico
  String descripcion; // Descripción adicional

  final antecedente = ToOne<AntecedentesPatologicosPersonales>();

  Enfermedad({
    this.id = 0,
    required this.nombre,
    required this.cronica,
    this.fecha,
    required this.descripcion,
  });
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

  // Resultados de la prueba citológica
  final resultadosCitologicos =
      ToMany<Citologia>(); // Relación uno a muchos con Citologia

  AntecedentesGinecologicos({this.id = 0});
}

@Entity()
class Citologia {
  int id; // field auto-incremented
  @Property(type: PropertyType.date)
  DateTime fecha; // Fecha de la prueba citológica
  String resultado; // Resultado de la prueba (normal, anormal)
  bool fueraDePrograma; // Indica si es fuera de programa
  String? observaciones; // Observaciones adicionales

  final antecedente = ToOne<AntecedentesGinecologicos>();

  Citologia({
    this.id = 0,
    required this.fecha,
    required this.resultado,
    required this.fueraDePrograma,
    this.observaciones,
  });
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
  int numeroEmbarazo; // Número de embarazo
  @Property(type: PropertyType.date)
  DateTime fecha; // Fecha del embarazo
  int semanasGestacion; // Semanas de gestación
  String? abortoEtiologia; // Etiología del aborto (si aplica)
  String caracteristicasNacimiento; // Características del nacimiento
  String tipoParto; // Tipo de parto (natural, cesárea, etc.)
  String tipoDistocia; // Tipo de distocia (si aplica)
  String lugarParto; // Lugar del parto

  @Backlink("embarazo")
  final recienNacidos =
      ToMany<RecienNacido>(); // Relación uno a muchos con ReciénNacido

  final antecedente = ToOne<AntecedentesObstetricos>();

  Embarazo({
    this.id = 0,
    required this.numeroEmbarazo,
    required this.fecha,
    required this.semanasGestacion,
    this.abortoEtiologia,
    required this.caracteristicasNacimiento,
    required this.tipoParto,
    required this.tipoDistocia,
    required this.lugarParto,
  });
}

@Entity()
class RecienNacido {
  int id; // field auto-incremented
  double peso; // Peso del recién nacido
  String sexo; // Sexo del recién nacido
  String estado; // Estado del recién nacido (vivo, prematuro, etc.)
  String? datosInteres; // Datos de interés adicionales
  int apgar; // Puntuación de Apgar
  int puntos; // Puntos (sistema de puntuación adicional)
  String? ocurrenciaDefuncion;
  String? edadAlFallecer;

  final embarazo = ToOne<Embarazo>();

  RecienNacido({
    this.id = 0,
    required this.peso,
    required this.sexo,
    required this.estado,
    this.datosInteres,
    required this.apgar,
    required this.puntos,
  });
}
