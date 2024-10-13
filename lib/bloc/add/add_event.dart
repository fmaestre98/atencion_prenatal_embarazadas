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
