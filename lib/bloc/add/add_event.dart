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

// Agrega eventos similares para las demás categorías...

// Evento para enviar todos los datos y guardar en la base de datos
class SubmitPaciente extends AddPacienteEvent {}
