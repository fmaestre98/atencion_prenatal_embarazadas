// lib/bloc/add_paciente_state.dart
import 'package:atencion_prenatal_embarazadas/models/examen_fisico_model.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interconsultas_model.dart';
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/interrogatory_model.dart';
import '../../models/personal_data_model.dart';

class AddPacienteState extends Equatable {
  final Paciente? paciente;
  final Interrogatorio? interrogatorio;
  final SignosVitalesModel? signosVitales;
  final ExamenFisicoModel? examenFisicoModel;
  final LaboratorioMicrobiologiaModel? laboratorioMicrobiologiaModel;
  final GeneticaModel? geneticaModel;
  final EmbarazoActual? embarazoActual;
  final InterconsultasModel? interconsultasModel;
  final List<FetoUltrasonido1erTrimestre>? fetos1erTrimestre;
  final List<FetoUltrasonidoSeguimiento>? fetosSeguimiento;
  final List<Embarazo>? embarazoList;
  final AntecedentesPatologicosPersonales? antecedentesPatologicosPersonales;
  final AntecedentesGinecologicos? antecedentesGinecologicos;
  final AntecedentesObstetricos? antecedentesObstetricos;
  final bool pacienteLoaded;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isSuccessInterrogatorio;
  final bool isSuccessSignosVitales;
  final bool isSuccessExamenFisico;
  final bool isSuccessLaboratorio;
  final bool isSuccessGenetica;
  final String? errorMessage;
  final bool isDeleting;
  final bool deleteSuccess;
  final String? deleteError;
  final int currentStepDatosPersonales;
  final int currentStepInterrogatorio;
  final int currentStepSignosVitales;
  final int currentStepExamenFisico;
  final int currentStepLaboratorio;
  final int currentStepGenetica;
  final int currentStepInterconsultas;
  final bool isSuccessInterconsultas;

  const AddPacienteState({
    this.paciente,
    this.interrogatorio,
    this.signosVitales,
    this.examenFisicoModel,
    this.laboratorioMicrobiologiaModel,
    this.geneticaModel,
    this.interconsultasModel,
    this.fetos1erTrimestre,
    this.fetosSeguimiento,
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
    this.currentStepLaboratorio = 0,
    this.currentStepGenetica = 0,
    this.embarazoActual,
    this.currentStepExamenFisico = 0,
    this.isSuccessExamenFisico = false,
    this.isSuccessSignosVitales = false,
    this.isSuccessLaboratorio = false,
    this.isSuccessGenetica = false,
    this.currentStepInterconsultas = 0,
    this.isSuccessInterconsultas = false,
    this.antecedentesPatologicosPersonales,
    this.antecedentesGinecologicos,
    this.antecedentesObstetricos,
    this.embarazoList,
  });

  AddPacienteState copyWith({
    Paciente? paciente,
    Interrogatorio? interrogatorio,
    SignosVitalesModel? signosVitales,
    ExamenFisicoModel? examenFisico,
    LaboratorioMicrobiologiaModel? laboratorio,
    GeneticaModel? genetica,
    InterconsultasModel? interconsultasModel,
    List<FetoUltrasonido1erTrimestre>? fetos1erTrimestre,
    List<FetoUltrasonidoSeguimiento>? fetosSeguimiento,
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
    bool? isSuccessLaboratorio,
    int? currentStepLaboratorio,
    int? currentStepGenetica,
    bool? isSuccessGenetica,
    bool? isSuccessInterconsultas,
    int? currentStepInterconsultas,
    AntecedentesPatologicosPersonales? antecedentesPatologicosPersonales,
    AntecedentesGinecologicos? antecedentesGinecologicos,
    AntecedentesObstetricos? antecedentesObstetricos,
    List<Embarazo>? embarazoList,
  }) {
    return AddPacienteState(
      paciente: paciente ?? this.paciente,
      interrogatorio: interrogatorio ?? this.interrogatorio,
      signosVitales: signosVitales ?? this.signosVitales,
      examenFisicoModel: examenFisico ?? this.examenFisicoModel,
      laboratorioMicrobiologiaModel:
          laboratorio ?? this.laboratorioMicrobiologiaModel,
      interconsultasModel: interconsultasModel ?? this.interconsultasModel,
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
      currentStepLaboratorio:
          currentStepLaboratorio ?? this.currentStepLaboratorio,
      isSuccessLaboratorio: isSuccessLaboratorio ?? this.isSuccessLaboratorio,
      geneticaModel: genetica ?? this.geneticaModel,
      currentStepGenetica: currentStepGenetica ?? this.currentStepGenetica,
      isSuccessGenetica: isSuccessGenetica ?? this.isSuccessGenetica,
      isSuccessInterconsultas:
          isSuccessInterconsultas ?? this.isSuccessInterconsultas,
      currentStepInterconsultas:
          currentStepInterconsultas ?? this.currentStepInterconsultas,
      fetos1erTrimestre: fetos1erTrimestre ?? this.fetos1erTrimestre,
      fetosSeguimiento: fetosSeguimiento ?? this.fetosSeguimiento,
      antecedentesPatologicosPersonales: antecedentesPatologicosPersonales ??
          this.antecedentesPatologicosPersonales,
      antecedentesGinecologicos:
          antecedentesGinecologicos ?? this.antecedentesGinecologicos,
      antecedentesObstetricos:
          antecedentesObstetricos ?? this.antecedentesObstetricos,
      embarazoList: embarazoList ?? this.embarazoList,
    );
  }

  @override
  List<Object?> get props => [
        paciente,
        interrogatorio,
        signosVitales,
        examenFisicoModel,
        interconsultasModel,
        laboratorioMicrobiologiaModel,
        pacienteLoaded,
        isSubmitting,
        isSuccess,
        errorMessage,
        currentStepDatosPersonales,
        currentStepInterrogatorio,
        currentStepSignosVitales,
        currentStepExamenFisico,
        currentStepLaboratorio,
        geneticaModel,
        currentStepGenetica,
        isSuccessGenetica,
        isSuccessInterconsultas,
        isSuccessInterrogatorio,
        isSuccessSignosVitales,
        isSuccessExamenFisico,
        isSuccessLaboratorio,
        currentStepInterconsultas,
        embarazoActual,
        fetosSeguimiento,
        fetos1erTrimestre,
        antecedentesPatologicosPersonales,
        antecedentesGinecologicos,
        antecedentesObstetricos,
        embarazoList,
      ];
}
