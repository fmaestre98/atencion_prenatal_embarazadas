// lib/bloc/add_paciente_state.dart
import 'package:equatable/equatable.dart';

import '../../models/interrogatory_model.dart';
import '../../models/personal_data_model.dart';

class AddPacienteState extends Equatable {
  final Paciente? paciente;
  final Interrogatorio? interrogatorio;
  // Agrega otros campos opcionales para las demás categorías

  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const AddPacienteState({
    this.paciente,
    this.interrogatorio,
    // Inicializa otros campos...
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  AddPacienteState copyWith({
    Paciente? paciente,
    Interrogatorio? interrogatorio,
    // Otros campos...
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return AddPacienteState(
      paciente: paciente ?? this.paciente,
      interrogatorio: interrogatorio ?? this.interrogatorio,
      // Otros campos...
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    paciente,
    interrogatorio,
    // Otros campos...
    isSubmitting,
    isSuccess,
    errorMessage,
  ];
}
