import 'package:atencion_prenatal_embarazadas/core/utils.dart';
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
    on<UpdateFechaNacimiento>(_onUpdateFechaNacimiento);
    // Maneja otros eventos similares...
    on<SubmitPaciente>(_onSubmitPaciente);
    on<UpdatePacienteLoaded>(_onUpdatePacienteLoaded);
    on<DeletePaciente>(_onDeletePaciente);
    on<UpdateCurrentStep>(_onUpdateCurrentStepDatosPersonales);
    on<UpdateUltimaMenstruacion>(_onUpdateFechaUltimaMenstruacion);
    on<UpdateDesconocida>(_onUpdateDesconocida);
    on<UpdateNoConfiable>(_onUpdateNoConfiable);
    on<UpdateFechaProbableParto>(_onUpdateFechaProbableParto);
    on<UpdateCurrentStepInterrogatorio>(_onUpdateCurrentStepInterrogatorio);
    on<UpdateCurrentStepSignosVitales>(_onUpdateCurrentStepSignosVitales);
    on<UpdateCurrentStepExamenFisico>(_onUpdateCurrentStepExamenFisico);
    on<UpdateCurrentStepInterconsultas>(_onUpdateCurrentStepInterconsultas);
    on<UpdateExamenFisico>(_onUpdateExamenFisico);
    on<UpdateLaboratorio>(_onUpdateLaboratorio);
    on<UpdateCurrentStepLaboratorio>(_onUpdateCurrentStepLaboratorio);
    on<UpdateGenetica>(_onUpdateGenetica);
    on<UpdateInterconsultas>(_onUpdateInterconsultas);
    on<UpdateFetoUltrasonido1erTrimestre>(_onUpdateFetoUltrasonido1erTrimestre);
    on<AddFetoUltrasonido1erTrimestre>(_onAddFetoUltrasonido1erTrimestre);

  }

  void _loadPacienteData(LoadPacienteData event, Emitter<AddPacienteState> emit) {
    safePrint("called _loadPacienteData");
    if(event.pacienteId != null ){
      // Aquí carga el paciente usando el ID
      final paciente = _objectBox.getPacienteById(event.pacienteId!); // Asume que tienes un método para obtener el paciente por ID
      safePrint('cubit ${paciente?.nombre}');
      if (paciente != null) {
        emit(state.copyWith(paciente: paciente, pacienteLoaded: true, fechaNacimiento: paciente.fechaNacimiento));
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
      UpdateDatosPersonales event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(paciente: event.paciente));
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    _savePaciente();
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }

  void _onUpdateFechaNacimiento(
      UpdateFechaNacimiento event, Emitter<AddPacienteState> emit) {
    print("my-logs $event.fechaNacimiento");
    emit(state.copyWith(fechaNacimiento: event.fechaNacimiento));
  }

  void _onUpdateFechaUltimaMenstruacion(
      UpdateUltimaMenstruacion event, Emitter<AddPacienteState> emit) {
    if(state.embarazoActual == null){
      EmbarazoActual embarazo = EmbarazoActual(null, false, false, null, 0, 0, id: 0);
      embarazo.fechaUltimaMenstruacion = event.fecha;
      emit(state.copyWith(embarazoActual: embarazo));
    } else {
      state.embarazoActual!.fechaUltimaMenstruacion = event.fecha;
      emit(state.copyWith(embarazoActual: state.embarazoActual));
    }
  }

  void _onUpdateFechaProbableParto(
      UpdateFechaProbableParto event, Emitter<AddPacienteState> emit) {
    if(state.embarazoActual == null){
      EmbarazoActual embarazo = EmbarazoActual(null, false, false, null, 0, 0, id: 0);
      embarazo.fechaPartoEstimado = event.fecha;
      emit(state.copyWith(embarazoActual: embarazo));
    } else {
      state.embarazoActual!.fechaPartoEstimado = event.fecha;
      emit(state.copyWith(embarazoActual: state.embarazoActual));
    }
  }

  void _onUpdateNoConfiable(
      UpdateNoConfiable event, Emitter<AddPacienteState> emit) {
    if(state.embarazoActual == null){
      EmbarazoActual embarazo = EmbarazoActual(null, false, false, null, 0, 0, id: 0);
      embarazo.noConfiable = event.noConfiable;
      emit(state.copyWith(embarazoActual: embarazo));
    } else {
      state.embarazoActual!.noConfiable = event.noConfiable;
      emit(state.copyWith(embarazoActual: state.embarazoActual));
    }
  }

  void _onUpdateDesconocida(
      UpdateDesconocida event, Emitter<AddPacienteState> emit) {
    if(state.embarazoActual == null){
      EmbarazoActual embarazo = EmbarazoActual(null, false, false, null, 0, 0, id: 0);
      embarazo.desconocida = event.desconocida;
      emit(state.copyWith(embarazoActual: embarazo));
    } else {
      state.embarazoActual!.desconocida = event.desconocida;
      emit(state.copyWith(embarazoActual: state.embarazoActual));
    }
  }

  void _onUpdateInterrogatorio(
      UpdateInterrogatorio event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(interrogatorio: event.interrogatorio));
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    _savePaciente();
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }

  void _onUpdateSignosVitales(
      UpdateSignosVitales event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(signosVitales: event.signosVitalesModel));
    _savePaciente();
  }

  void _onUpdateExamenFisico(
      UpdateExamenFisico event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(examenFisico: event.examenFisicoModel));
    _savePaciente();
  }

  // Implementa métodos para manejar otros eventos...

  Future<void> _onSubmitPaciente(
      SubmitPaciente event, Emitter<AddPacienteState> emit) async {
    _savePaciente();
  }

  Future<void> _savePaciente() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      // Asume que ya has llenado todas las secciones necesarias
      // Aquí puedes validar que todas las secciones estén llenas
      safePrint(state.paciente != null);
      // Guarda los datos de Paciente
      if(state.paciente != null){
        _objectBox.addPaciente(state.paciente!);
        // Si hay interrogatorio, asócialo con el Paciente this dont make sense
        /* if (state.interrogatorio != null) {
        state.interrogatorio!.paciente.target = _objectBox.pacienteBox.get(pacienteId);
        _objectBox.interrogatorioBox.put(state.interrogatorio!);
      }*/
        safePrint("hereeeee");
        // Guarda otras secciones similares...
      }
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
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

}
