// lib/bloc/add_paciente_state.dart
import 'package:equatable/equatable.dart';

import '../../models/interrogatory_model.dart';
import '../../models/personal_data_model.dart';

class AddPacienteState extends Equatable {
  final Paciente? paciente;
  final Interrogatorio? interrogatorio;
  final DateTime? fechaNacimiento;
  final bool pacienteLoaded;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;
  final bool isDeleting; // Nuevo estado para la eliminación
  final bool deleteSuccess;
  final String? deleteError;

  const AddPacienteState({
    this.paciente,
    this.interrogatorio,
    this.fechaNacimiento,
    this.pacienteLoaded = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.deleteError,
  });

  AddPacienteState copyWith({
    Paciente? paciente,
    Interrogatorio? interrogatorio,
    DateTime? fechaNacimiento,
    bool? pacienteLoaded,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
    bool? isDeleting,
    bool? deleteSuccess,
    String? deleteError,
  }) {
    return AddPacienteState(
      paciente: paciente ?? this.paciente,
      interrogatorio: interrogatorio ?? this.interrogatorio,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      pacienteLoaded: pacienteLoaded ?? this.pacienteLoaded,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      isDeleting: isDeleting ?? this.isDeleting,
      deleteSuccess: deleteSuccess ?? this.deleteSuccess,
      deleteError: deleteError,
    );
  }

  @override
  List<Object?> get props => [
    paciente,
    interrogatorio,
    fechaNacimiento,
    pacienteLoaded,
    isSubmitting,
    isSuccess,
    errorMessage,
    isDeleting,
    deleteSuccess,
    deleteError,
  ];
}
