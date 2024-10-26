// lib/bloc/add_paciente_state.dart
import 'package:atencion_prenatal_embarazadas/models/examen_fisico_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/interrogatory_model.dart';
import '../../models/personal_data_model.dart';

class AddPacienteState extends Equatable {
  final Paciente? paciente;
  final Interrogatorio? interrogatorio;
  final SignosVitalesModel? signosVitales;
  final ExamenFisicoModel? examenFisicoModel;
  final EmbarazoActual? embarazoActual;
  final DateTime? fechaNacimiento;
  final bool pacienteLoaded;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isSuccessInterrogatorio;
  final bool isSuccessSignosVitales;
  final bool isSuccessExamenFisico;
  final String? errorMessage;
  final bool isDeleting;
  final bool deleteSuccess;
  final String? deleteError;
  final int currentStepDatosPersonales;
  final int currentStepInterrogatorio;
  final int currentStepSignosVitales;
  final int currentStepExamenFisico;

  const AddPacienteState({
    this.paciente,
    this.interrogatorio,
    this.signosVitales,
    this.examenFisicoModel,
    this.fechaNacimiento,
    this.pacienteLoaded = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isSuccessInterrogatorio = false,
    this.errorMessage,
    this.isDeleting = false,
    this.deleteSuccess = false,
    this.deleteError,
    this.currentStepDatosPersonales = 0,
    this.currentStepInterrogatorio = 0,
    this.currentStepSignosVitales = 0,
    this.embarazoActual,
    this.currentStepExamenFisico = 0,
    this.isSuccessExamenFisico = false,
    this.isSuccessSignosVitales = false,
  });

  AddPacienteState copyWith({
    Paciente? paciente,
    Interrogatorio? interrogatorio,
    SignosVitalesModel? signosVitales,
    ExamenFisicoModel? examenFisico,
    DateTime? fechaNacimiento,
    bool? pacienteLoaded,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isSuccessInterrogatorio,
    String? errorMessage,
    bool? isDeleting,
    bool? deleteSuccess,
    String? deleteError,
    int? currentStepDatosPersonales,
    int? currentStepInterrogatorio,
    EmbarazoActual? embarazoActual,
    int? currentStepSignosVitales,
    int? currentStepExamenFisico,
    bool? isSuccessExamenFisico,
    bool? isSuccessSignosVitales,
  }) {
    return AddPacienteState(
      paciente: paciente ?? this.paciente,
      interrogatorio: interrogatorio ?? this.interrogatorio,
      signosVitales: signosVitales ?? this.signosVitales,
      examenFisicoModel: examenFisico ?? this.examenFisicoModel,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      pacienteLoaded: pacienteLoaded ?? this.pacienteLoaded,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isSuccessInterrogatorio:
          isSuccessInterrogatorio ?? this.isSuccessInterrogatorio,
      errorMessage: errorMessage,
      isDeleting: isDeleting ?? this.isDeleting,
      deleteSuccess: deleteSuccess ?? this.deleteSuccess,
      deleteError: deleteError,
      currentStepDatosPersonales:
          currentStepDatosPersonales ?? this.currentStepDatosPersonales,
      embarazoActual: embarazoActual ?? this.embarazoActual,
      currentStepInterrogatorio:
          currentStepInterrogatorio ?? this.currentStepInterrogatorio,
      currentStepSignosVitales:
          currentStepSignosVitales ?? this.currentStepSignosVitales,
      currentStepExamenFisico:
          currentStepExamenFisico ?? this.currentStepExamenFisico,
      isSuccessExamenFisico:
          isSuccessExamenFisico ?? this.isSuccessExamenFisico,
      isSuccessSignosVitales:
          isSuccessSignosVitales ?? this.isSuccessSignosVitales,
    );
  }

  @override
  List<Object?> get props => [
        paciente,
        interrogatorio,
        signosVitales,
        fechaNacimiento,
        pacienteLoaded,
        isSubmitting,
        isSuccess,
        errorMessage,
        isDeleting,
        deleteSuccess,
        deleteError,
        currentStepDatosPersonales,
        currentStepInterrogatorio,
        currentStepSignosVitales,
      ];
}
