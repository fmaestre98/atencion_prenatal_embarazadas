import 'package:atencion_prenatal_embarazadas/models/examen_fisico_model.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interconsultas_model.dart';
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/interrogatory_model.dart';
import '../../models/personal_data_model.dart';

abstract class AddPacienteEvent extends Equatable {
  const AddPacienteEvent();

  @override
  List<Object?> get props => [];
}

// Evento para actualizar Datos Personales
class UpdateDatosPersonales extends AddPacienteEvent {
  final Paciente paciente;

  const UpdateDatosPersonales({required this.paciente});

  @override
  List<Object?> get props => [paciente];
}

// Evento para actualizar Datos Personales
class LoadPacienteData extends AddPacienteEvent {
  final int? pacienteId;

  const LoadPacienteData({this.pacienteId});

  @override
  List<Object?> get props => [pacienteId];
}

// Evento para actualizar Datos Personales
class UpdatePacienteLoaded extends AddPacienteEvent {
  final bool? pacienteLoaded;

  const UpdatePacienteLoaded({this.pacienteLoaded});

  @override
  List<Object?> get props => [pacienteLoaded];
}

class UpdateFechaNacimiento extends AddPacienteEvent {
  final DateTime fechaNacimiento;

  const UpdateFechaNacimiento({required this.fechaNacimiento});
}

class UpdateUltimaMenstruacion extends AddPacienteEvent {
  final DateTime fecha;

  const UpdateUltimaMenstruacion({required this.fecha});
}

class UpdateFechaProbableParto extends AddPacienteEvent {
  final DateTime fecha;

  const UpdateFechaProbableParto({required this.fecha});
}

class UpdateDesconocida extends AddPacienteEvent {
  final bool desconocida;

  const UpdateDesconocida({required this.desconocida});
}

class UpdateNoConfiable extends AddPacienteEvent {
  final bool noConfiable;

  const UpdateNoConfiable({required this.noConfiable});
}

class UpdateCurrentStep extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStep({required this.step});
}

class UpdateCurrentStepInterrogatorio extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepInterrogatorio({required this.step});
}

class UpdateCurrentStepSignosVitales extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepSignosVitales({required this.step});
}

class UpdateCurrentStepExamenFisico extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepExamenFisico({required this.step});
}

class UpdateCurrentStepLaboratorio extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepLaboratorio({required this.step});
}

class UpdateCurrentStepGenetica extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepGenetica({required this.step});
}

class UpdateCurrentStepInterconsultas extends AddPacienteEvent {
  final int step;

  const UpdateCurrentStepInterconsultas({required this.step});
}

class DeletePaciente extends AddPacienteEvent {
  final int pacienteId;

  const DeletePaciente({required this.pacienteId});

  @override
  List<Object?> get props => [pacienteId];
}

// Evento para actualizar Interrogatorio
class UpdateInterrogatorio extends AddPacienteEvent {
  final Interrogatorio interrogatorio;

  const UpdateInterrogatorio({required this.interrogatorio});

  @override
  List<Object?> get props => [interrogatorio];
}

// Evento para actualizar signos vitales
class UpdateSignosVitales extends AddPacienteEvent {
  final SignosVitalesModel signosVitalesModel;

  const UpdateSignosVitales({required this.signosVitalesModel});

  @override
  List<Object?> get props => [signosVitalesModel];
}

// Evento para actualizar examen fisico
class UpdateExamenFisico extends AddPacienteEvent {
  final ExamenFisicoModel examenFisicoModel;

  const UpdateExamenFisico({required this.examenFisicoModel});

  @override
  List<Object?> get props => [examenFisicoModel];
}

class UpdateLaboratorio extends AddPacienteEvent {
  final LaboratorioMicrobiologiaModel model;

  const UpdateLaboratorio({required this.model});

  @override
  List<Object?> get props => [model];
}

class UpdateGenetica extends AddPacienteEvent {
  final GeneticaModel model;

  const UpdateGenetica({required this.model});

  @override
  List<Object?> get props => [model];
}

class UpdateInterconsultas extends AddPacienteEvent {
  final InterconsultasModel model;

  const UpdateInterconsultas({required this.model});

  @override
  List<Object?> get props => [model];
}

class UpdateFetoUltrasonido1erTrimestre extends AddPacienteEvent {
  final FetoUltrasonido1erTrimestre feto;
  final int index;
  const UpdateFetoUltrasonido1erTrimestre({required this.feto, required this.index});

  @override
  List<Object?> get props => [feto, index];
}

class DeleteFetoUltrasonido1erTrimestre extends AddPacienteEvent {
  final int index;
  const DeleteFetoUltrasonido1erTrimestre({required this.index});

  @override
  List<Object?> get props => [index];
}

class AddFetoUltrasonido1erTrimestre extends AddPacienteEvent {
  final FetoUltrasonido1erTrimestre feto;

  const AddFetoUltrasonido1erTrimestre({required this.feto});

  @override
  List<Object?> get props => [feto];
}

class UpdateFetoUltrasonidoSeguimiento extends AddPacienteEvent {
  final FetoUltrasonidoSeguimiento feto;
  final int index;
  const UpdateFetoUltrasonidoSeguimiento({required this.feto, required this.index});

  @override
  List<Object?> get props => [feto, index];
}

class DeleteFetoUltrasonidoSeguimiento extends AddPacienteEvent {
  final int index;
  const DeleteFetoUltrasonidoSeguimiento({required this.index});

  @override
  List<Object?> get props => [index];
}

class AddFetoUltrasonidoSeguimiento extends AddPacienteEvent {
  final FetoUltrasonidoSeguimiento feto;

  const AddFetoUltrasonidoSeguimiento({required this.feto});

  @override
  List<Object?> get props => [feto];
}

// Agrega eventos similares para las demás categorías...

// Evento para enviar todos los datos y guardar en la base de datos
class SubmitPaciente extends AddPacienteEvent {}
