import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/models/interrogatory_model.dart';
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/database/objectbox.dart';
import '../../models/genetica_model.dart';
import 'add_event.dart';
import 'add_state.dart';

class AddPacienteBloc extends Bloc<AddPacienteEvent, AddPacienteState> {
  final ObjectBox _objectBox = GetIt.instance<ObjectBox>();

  AddPacienteBloc() : super(const AddPacienteState()) {
    // Cargar los datos del paciente usando el ID
    on<LoadPacienteData>(_loadPacienteData);
    on<UpdateDatosPersonales>(_onUpdateDatosPersonales);
    on<UpdateInterrogatorio>(_onUpdateInterrogatorio);
    on<UpdateSignosVitales>(_onUpdateSignosVitales);
    // Maneja otros eventos similares...
    on<SubmitPaciente>(_onSubmitPaciente);
    on<SubmitInterrogatorio>(_onSubmitInterrogatorio);
    on<SubmitSignosVitales>(_onSubmitSignosVitales);
    on<SubmitInterconsultas>(_onSubmitInterconsultas);
    on<SubmitExamenFisico>(_onSubmitExamenFisico);
    on<SubmitGenetica>(_onSubmitGenetica);
    on<SubmitLaboratorio>(_onSubmitLaboratorio);
    on<UpdatePacienteLoaded>(_onUpdatePacienteLoaded);
    on<UpdateCurrentStep>(_onUpdateCurrentStepDatosPersonales);
    on<UpdateEmbarazoActual>(_onUpdateEmbarazoActual);
    on<UpdateCurrentStepInterrogatorio>(_onUpdateCurrentStepInterrogatorio);
    on<UpdateCurrentStepSignosVitales>(_onUpdateCurrentStepSignosVitales);
    on<UpdateCurrentStepExamenFisico>(_onUpdateCurrentStepExamenFisico);
    on<UpdateCurrentStepInterconsultas>(_onUpdateCurrentStepInterconsultas);
    on<UpdateExamenFisico>(_onUpdateExamenFisico);
    on<UpdateLaboratorio>(_onUpdateLaboratorio);
    on<UpdateCurrentStepLaboratorio>(_onUpdateCurrentStepLaboratorio);
    on<UpdateCurrentStepGenetica>(_onUpdateCurrentStepGenetica);
    on<UpdateGenetica>(_onUpdateGenetica);
    on<UpdateInterconsultas>(_onUpdateInterconsultas);
    on<UpdateFetoUltrasonido1erTrimestre>(_onUpdateFetoUltrasonido1erTrimestre);
    on<AddFetoUltrasonido1erTrimestre>(_onAddFetoUltrasonido1erTrimestre);
    on<UpdateFetoUltrasonidoSeguimiento>(_onUpdateFetoUltrasonidoSeguimiento);
    on<AddFetoUltrasonidoSeguimiento>(_onAddFetoUltrasonidoSeguimiento);

  }

  void _loadPacienteData(LoadPacienteData event, Emitter<AddPacienteState> emit) {
    safePrint("called _loadPacienteData");
    if(event.pacienteId != null ){
      // Aquí carga el paciente usando el ID
      final paciente = _objectBox.getPacienteById(event.pacienteId!); // Asume que tienes un método para obtener el paciente por ID
      safePrint('cubit ${paciente?.toString()}');
      if (paciente != null) {
        emit(state.copyWith(paciente: paciente,
            interrogatorio: paciente.interrogatorio.target,
            signosVitales: paciente.signosVitales.target,
            examenFisico: paciente.examenFisico.target,
            embarazoActual: paciente.embarazoActual.target,
            interconsultasModel: paciente.interconsultas.target,
            laboratorio: paciente.laboratorio.target,
            pacienteLoaded: true,));
      }
    }
  }

  void _onUpdatePacienteLoaded(
      UpdatePacienteLoaded event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(pacienteLoaded: event.pacienteLoaded));
  }

  void _onUpdateCurrentStepDatosPersonales(
      UpdateCurrentStep event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepDatosPersonales: event.step));
  }

  void _onUpdateCurrentStepInterrogatorio(
      UpdateCurrentStepInterrogatorio event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepInterrogatorio: event.step));
  }

  void _onUpdateCurrentStepSignosVitales(
      UpdateCurrentStepSignosVitales event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepSignosVitales: event.step));
  }

  void _onUpdateCurrentStepExamenFisico(
      UpdateCurrentStepExamenFisico event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepExamenFisico: event.step));
  }

  void _onUpdateCurrentStepInterconsultas(
      UpdateCurrentStepInterconsultas event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepInterconsultas: event.step));
  }

  void _onUpdateCurrentStepLaboratorio(
      UpdateCurrentStepLaboratorio event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepLaboratorio: event.step));
  }

  void _onUpdateCurrentStepGenetica(
      UpdateCurrentStepGenetica event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(currentStepGenetica: event.step));
  }

  void _onUpdateLaboratorio(
      UpdateLaboratorio event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(laboratorio: event.model));
  }

  void _onUpdateInterconsultas(
      UpdateInterconsultas event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(interconsultasModel: event.model));
  }

  void _onUpdateGenetica(
      UpdateGenetica event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(genetica: event.model));
  }


  void _onUpdateDatosPersonales(
      UpdateDatosPersonales event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(paciente: event.paciente));
  }



  void _onUpdateEmbarazoActual(
      UpdateEmbarazoActual event, Emitter<AddPacienteState> emit) {

    emit(state.copyWith(embarazoActual: event.embarazoActual));
  }

  void _onUpdateInterrogatorio(
      UpdateInterrogatorio event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(interrogatorio: event.interrogatorio));
  }

  void _onUpdateSignosVitales(
      UpdateSignosVitales event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(signosVitales: event.signosVitalesModel));
  }

  void _onUpdateExamenFisico(
      UpdateExamenFisico event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(examenFisico: event.examenFisicoModel));
  }

  // Implementa métodos para manejar otros eventos...

  Future<void> _onSubmitPaciente(
      SubmitPaciente event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccess: true));
  }

  Future<void> _onSubmitInterrogatorio(
      SubmitInterrogatorio event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessInterrogatorio: true));
  }

  Future<void> _onSubmitInterconsultas(
      SubmitInterconsultas event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessInterconsultas: true));
  }

  Future<void> _onSubmitSignosVitales(
      SubmitSignosVitales event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessSignosVitales: true));
  }

  Future<void> _onSubmitExamenFisico(
      SubmitExamenFisico event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessExamenFisico: true));
  }


  Future<void> _onSubmitGenetica(
      SubmitGenetica event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessGenetica: true));
  }


  Future<void> _onSubmitLaboratorio(
      SubmitLaboratorio event, Emitter<AddPacienteState> emit) async {
    await _savePaciente();
    emit(state.copyWith(isSuccessLaboratorio: true));
  }

  Future<void> _savePaciente() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      // Asume que ya has llenado todas las secciones necesarias
      // Aquí puedes validar que todas las secciones estén llenas
      Paciente? paciente = state.paciente;
      safePrint(state.paciente != null);
      // Guarda los datos de Paciente
      if(paciente != null){
        paciente.fechaDeRegistro ??= DateTime.now();
        paciente.embarazoActual.target = state.embarazoActual;
        safePrint(state.embarazoActual);
        paciente.interrogatorio.target = state.interrogatorio;
        paciente.signosVitales.target = state.signosVitales;
        paciente.examenFisico.target = state.examenFisicoModel;
        paciente.laboratorio.target = state.laboratorioMicrobiologiaModel;
        paciente.genetica.target = state.geneticaModel;
        safePrint(paciente.toString());
        _objectBox.addPaciente(paciente);
        // Si hay interrogatorio, asócialo con el Paciente this dont make sense
        /* if (state.interrogatorio != null) {
        state.interrogatorio!.paciente.target = _objectBox.pacienteBox.get(pacienteId);
        _objectBox.interrogatorioBox.put(state.interrogatorio!);
      }*/
        safePrint("hereeeee");
        // Guarda otras secciones similares...
      }
      emit(state.copyWith(isSubmitting: false));
    } catch (e) {
      safePrint("jejejejejej $e");
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeletePaciente(
      DeletePaciente event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(isDeleting: true, deleteError: null));
    try {
      _objectBox.deletePaciente(event.pacienteId);
      emit(state.copyWith(isDeleting: false, deleteSuccess: true));
    } catch (e) {
      safePrint("Error al eliminar paciente: $e");
      emit(state.copyWith(
        isDeleting: false,
        deleteError: e.toString(),
      ));
    }
  }

  // Manejador para actualizar los datos de un feto específico
  void _onUpdateFetoUltrasonido1erTrimestre(
      UpdateFetoUltrasonido1erTrimestre event, Emitter<AddPacienteState> emit) {
    GeneticaModel? geneticaModel = state.geneticaModel;
    if(geneticaModel != null){
      geneticaModel.fetos1erTrimestre[event.index] = event.feto;
    }
    emit(state.copyWith(
      genetica: geneticaModel,
    ));
  }

  // Manejador para agregar un nuevo feto
  void _onAddFetoUltrasonido1erTrimestre(
      AddFetoUltrasonido1erTrimestre event, Emitter<AddPacienteState> emit) {
    GeneticaModel? geneticaModel = state.geneticaModel;
    if(geneticaModel != null){
      geneticaModel.fetos1erTrimestre.add(event.feto);
    }
    emit(state.copyWith(
      genetica: geneticaModel,
    ));
  }

  // Manejador para actualizar los datos de un feto específico
  void _onUpdateFetoUltrasonidoSeguimiento(
      UpdateFetoUltrasonidoSeguimiento event, Emitter<AddPacienteState> emit) {
    GeneticaModel? geneticaModel = state.geneticaModel;
    if(geneticaModel != null){
      geneticaModel.fetosSeguimiento[event.index] = event.feto;
    }
    emit(state.copyWith(
      genetica: geneticaModel,
    ));
  }

  // Manejador para agregar un nuevo feto
  void _onAddFetoUltrasonidoSeguimiento(
      AddFetoUltrasonidoSeguimiento event, Emitter<AddPacienteState> emit) {
    GeneticaModel? geneticaModel = state.geneticaModel;
    if(geneticaModel != null){
      geneticaModel.fetosSeguimiento.add(event.feto);
    }
    emit(state.copyWith(
      genetica: geneticaModel,
    ));
  }

}
