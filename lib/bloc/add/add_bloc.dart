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
    on<ClearPacienteData>(_clearPacienteData);
    on<
        UpdateDatosPersonales>(_onUpdateDatosPersonales);
    on<UpdateInterrogatorio>(_onUpdateInterrogatorio);
    on<UpdateSignosVitales>(_onUpdateSignosVitales);
    // Maneja otros eventos similares...
    on<SubmitPaciente>(_onSubmitDatosPersonales);
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
    on<DeleteFetoUltrasonido1erTrimestre>(_onDeleteFetoUltrasonido1erTrimestre);
    on<DeleteFetoUltrasonidoSeguimiento>(_onDeleteFetoUltrasonidoSeguimiento);
    on<AddFetoUltrasonido1erTrimestre>(_onAddFetoUltrasonido1erTrimestre);
    on<UpdateFetoUltrasonidoSeguimiento>(_onUpdateFetoUltrasonidoSeguimiento);
    on<AddFetoUltrasonidoSeguimiento>(_onAddFetoUltrasonidoSeguimiento);
    on<UpdateAntecedentesPatologicosPersonales>(
        _onUpdateAntecedentesPatologicosPersonales);
    on<UpdateAntecedentesGinecologicos>(_onUpdateAntecedentesGinecologicos);
    on<UpdateAntecedentesObstetricos>(_onUpdateAntecedentesObstetricos);
    on<AddEmbarazo>(_onAddEmbarazo);
    on<UpdateEmbarazo>(_onUpdateEmbarazo);
    on<DeleteEmbarazo>(_onDeleteEmbarazo);
  }

  void _loadPacienteData(
      LoadPacienteData event, Emitter<AddPacienteState> emit) {
    safePrint("called _loadPacienteData");
    if (event.pacienteId != null) {
      // Aquí carga el paciente usando el ID
      final paciente = _objectBox.getPacienteById(event
          .pacienteId!); // Asume que tienes un método para obtener el paciente por ID
      safePrint('cubit ${paciente?.toString()}');
      if (paciente != null) {
        emit(state.copyWith(
          paciente: paciente,
          interrogatorio: paciente.interrogatorio.target,
          signosVitales: paciente.signosVitales.target,
          examenFisico: paciente.examenFisico.target,
          embarazoActual: paciente.embarazoActual.target,
          interconsultasModel: paciente.interconsultas.target,
          laboratorio: paciente.laboratorio.target,
          genetica: paciente.genetica.target,
          fetos1erTrimestre: paciente.genetica.target?.fetos1erTrimestre,
          fetosSeguimiento: paciente.genetica.target?.fetosSeguimiento,
          antecedentesPatologicosPersonales:
              paciente.antecedentesPatologicasPersonales.target,
          antecedentesGinecologicos: paciente.antecedentesGinecologicos.target,
          antecedentesObstetricos: paciente.antecedentesObstetricos.target,
          embarazoList: paciente.antecedentesObstetricos.target?.embarazos,
          pacienteLoaded: true,
        ));
       }
    }
  }


  void _clearPacienteData(
      ClearPacienteData event, Emitter<AddPacienteState> emit) {
        emit(const AddPacienteState());
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

  void _onUpdateGenetica(UpdateGenetica event, Emitter<AddPacienteState> emit) {
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

  void _onUpdateAntecedentesPatologicosPersonales(
      UpdateAntecedentesPatologicosPersonales event,
      Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(antecedentesPatologicosPersonales: event.model));
  }

  void _onUpdateAntecedentesGinecologicos(UpdateAntecedentesGinecologicos event,
      Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(antecedentesGinecologicos: event.model));
  }

  void _onUpdateAntecedentesObstetricos(UpdateAntecedentesObstetricos event,
      Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(antecedentesObstetricos: event.model));
  }

  void _onUpdateSignosVitales(
      UpdateSignosVitales event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(signosVitales: event.signosVitalesModel));
  }

  void _onUpdateExamenFisico(
      UpdateExamenFisico event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(examenFisico: event.examenFisicoModel));
  }


  Future<void> _onSubmitInterconsultas(
      SubmitInterconsultas event, Emitter<AddPacienteState> emit) async {
    await _saveInterconsultas();
    emit(state.copyWith(isSuccessInterconsultas: true));
  }


  Future<void> _onSubmitExamenFisico(
      SubmitExamenFisico event, Emitter<AddPacienteState> emit) async {
    await _saveExamenFisico();
    emit(state.copyWith(isSuccessExamenFisico: true));
  }

  Future<void> _onSubmitGenetica(
      SubmitGenetica event, Emitter<AddPacienteState> emit) async {
    await _saveGenetica();
    emit(state.copyWith(isSuccessGenetica: true));
  }

  Future<void> _onSubmitLaboratorio(
      SubmitLaboratorio event, Emitter<AddPacienteState> emit) async {
    await _saveLaboratorio();
    emit(state.copyWith(isSuccessLaboratorio: true));
  }

  // Métodos separados para guardar secciones específicas
  Future<void> _saveDatosPersonales() async {
    safePrint(state.embarazoList);
    final paciente = state.paciente;
    if (paciente != null) {
      paciente.fechaDeRegistro ??= DateTime.now();
      paciente.embarazoActual.target = state.embarazoActual;

      if (state.antecedentesObstetricos != null) {
        AntecedentesObstetricos antecedentesObstetricos = state.antecedentesObstetricos!;

        // Obtener la lista actual de embarazos
        List<Embarazo> currentEmbarazos = antecedentesObstetricos.embarazos;

        // Crear un Set para identificar embarazos existentes
        Set<int> existingIds = currentEmbarazos.map((e) => e.id).toSet(); // Suponiendo que cada embarazo tiene un 'id'

        // Agregar o actualizar embarazos
        for (var nuevoEmbarazo in state.embarazoList ?? []) {
          if (existingIds.contains(nuevoEmbarazo.id)) {
            // Actualizar el embarazo existente
            int index = currentEmbarazos.indexWhere((e) => e.id == nuevoEmbarazo.id);
            currentEmbarazos[index] = nuevoEmbarazo; // Actualizar el objeto existente
          } else {
            // Agregar nuevo embarazo
            currentEmbarazos.add(nuevoEmbarazo);
          }
        }

        // Eliminar embarazos que ya no están en la nueva lista
        antecedentesObstetricos.embarazos.removeWhere((e) => !state.embarazoList!.any((ne) => ne.id == e.id));

        // Guardar cambios
        paciente.antecedentesObstetricos.target = antecedentesObstetricos;
        _objectBox.addAntecedentesObstetricos(antecedentesObstetricos);
      }

      paciente.antecedentesPatologicasPersonales.target =
          state.antecedentesPatologicosPersonales;
      paciente.antecedentesGinecologicos.target =
          state.antecedentesGinecologicos;

      _objectBox.addPaciente(paciente);
    }
  }

  Future<void> _saveInterrogatorio() async {
    if (state.interrogatorio != null) {
       state.paciente!.interrogatorio.target = state.interrogatorio!;
       _objectBox.addPaciente(state.paciente!);
      _objectBox.addInterrogatorio(state.interrogatorio!);
    }
  }

  Future<void> _saveSignosVitales() async {
    if (state.signosVitales != null) {
      state.paciente!.signosVitales.target = state.signosVitales!;
      _objectBox.addPaciente(state.paciente!);
      _objectBox.addSignosVitalesModel(state.signosVitales!);
    }
  }

  Future<void> _saveExamenFisico() async {
    if (state.examenFisicoModel != null) {
      state.paciente!.examenFisico.target = state.examenFisicoModel!;
      _objectBox.addPaciente(state.paciente!);
      _objectBox.addExamenFisico(state.examenFisicoModel!);
    }
  }

  Future<void> _saveGenetica() async {
    try {
      final genetica = state.geneticaModel;

      if (genetica == null) {
        safePrint("No hay datos genéticos para guardar.");
        return;
      }

      // Limpiar y actualizar fetos del primer trimestre
      List<FetoUltrasonido1erTrimestre> fetos1erTrimestre = state.fetos1erTrimestre ?? [];
      List<FetoUltrasonidoSeguimiento> fetosSeguimiento = state.fetosSeguimiento ?? [];

      // Actualizar fetos del primer trimestre
      Set<int> existingFetos1erTrimestreIds = genetica.fetos1erTrimestre.map((feto) => feto.id).toSet();

      for (var nuevoFeto in fetos1erTrimestre) {
        if (existingFetos1erTrimestreIds.contains(nuevoFeto.id)) {
          // Actualizar el feto existente
          int index = genetica.fetos1erTrimestre.indexWhere((feto) => feto.id == nuevoFeto.id);
          genetica.fetos1erTrimestre[index] = nuevoFeto; // Actualizar el objeto existente
        } else {
          // Agregar nuevo feto
          genetica.fetos1erTrimestre.add(nuevoFeto);
        }
      }

      // Eliminar fetos que ya no están en la nueva lista
      genetica.fetos1erTrimestre.removeWhere((feto) => !fetos1erTrimestre.any((nuevoFeto) => nuevoFeto.id == feto.id));

      // Actualizar fetos de seguimiento
      Set<int> existingFetosSeguimientoIds = genetica.fetosSeguimiento.map((feto) => feto.id).toSet();

      for (var nuevoFeto in fetosSeguimiento) {
        if (existingFetosSeguimientoIds.contains(nuevoFeto.id)) {
          // Actualizar el feto existente
          int index = genetica.fetosSeguimiento.indexWhere((feto) => feto.id == nuevoFeto.id);
          genetica.fetosSeguimiento[index] = nuevoFeto; // Actualizar el objeto existente
        } else {
          // Agregar nuevo feto
          genetica.fetosSeguimiento.add(nuevoFeto);
        }
      }

      // Eliminar fetos de seguimiento que ya no están en la nueva lista
      genetica.fetosSeguimiento.removeWhere((feto) => !fetosSeguimiento.any((nuevoFeto) => nuevoFeto.id == feto.id));

      // Actualizar el objeto paciente con los datos de genética
      state.paciente!.genetica.target = state.geneticaModel!;
      _objectBox.addPaciente(state.paciente!);

      // Guardar datos en ObjectBox
      _objectBox.addFetosTrimestre(genetica.fetos1erTrimestre);
      _objectBox.addFetosSeguimiento(genetica.fetosSeguimiento);
      _objectBox.addGeneticaModel(genetica);

      safePrint("Datos genéticos guardados exitosamente.");
    } catch (e, stackTrace) {
      // Manejo de errores
      safePrint("Error al guardar datos genéticos: $e");
      safePrint("StackTrace: $stackTrace");
    }
  }

  Future<void> _saveLaboratorio() async {
    if (state.laboratorioMicrobiologiaModel != null) {

      state.paciente!.laboratorio.target = state.laboratorioMicrobiologiaModel!;
      _objectBox.addPaciente(state.paciente!);
      _objectBox.addLaboratorioMicrobiologiaModel(
          state.laboratorioMicrobiologiaModel!);
    }
  }

  Future<void> _saveInterconsultas() async {
    if (state.interconsultasModel != null) {
      state.paciente!.interconsultas.target = state.interconsultasModel!;
      _objectBox.addPaciente(state.paciente!);
      _objectBox.addInterconsultasModel(state.interconsultasModel!);
    }
  }

// Métodos onSubmit específicos
  Future<void> _onSubmitDatosPersonales(
      SubmitPaciente event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _saveDatosPersonales();
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onSubmitInterrogatorio(
      SubmitInterrogatorio event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _saveInterrogatorio();
      emit(state.copyWith(isSubmitting: false, isSuccessInterrogatorio: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onSubmitSignosVitales(
      SubmitSignosVitales event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _saveSignosVitales();
      emit(state.copyWith(isSubmitting: false, isSuccessSignosVitales: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }

/*
  Future<void> _savePaciente() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      // Asume que ya has llenado todas las secciones necesarias
      // Aquí puedes validar que todas las secciones estén llenas
      Paciente? paciente = state.paciente;
      safePrint(state.paciente != null);
      // Guarda los datos de Paciente
      if (paciente != null) {
        paciente.fechaDeRegistro ??= DateTime.now();
        paciente.embarazoActual.target = state.embarazoActual;
        paciente.interrogatorio.target = state.interrogatorio;
        paciente.signosVitales.target = state.signosVitales;
        paciente.examenFisico.target = state.examenFisicoModel;
        paciente.laboratorio.target = state.laboratorioMicrobiologiaModel;
        GeneticaModel? genetica = state.geneticaModel;
        if (genetica != null) {
          genetica.fetos1erTrimestre.removeWhere((element) => true);
          genetica.fetos1erTrimestre.addAll(state.fetos1erTrimestre ?? []);
          genetica.fetosSeguimiento.removeWhere((element) => true);
          genetica.fetosSeguimiento.addAll(state.fetosSeguimiento ?? []);
          _objectBox.addFetosSeguimiento(state.fetosSeguimiento ?? []);
          _objectBox.addFetosTrimestre(state.fetos1erTrimestre ?? []);

        }
        paciente.genetica.target = genetica;
        paciente.antecedentesPatologicasPersonales.target =
            state.antecedentesPatologicosPersonales;
        paciente.antecedentesGinecologicos.target =
            state.antecedentesGinecologicos;
        paciente.antecedentesObstetricos.target = state.antecedentesObstetricos;
        _objectBox.addPaciente(paciente);
        if (state.embarazoActual != null) {
          _objectBox.addEmbarazoActual(state.embarazoActual!);
        }
        if (state.antecedentesPatologicosPersonales != null) {
          _objectBox.addAntecedentesPatologicosPersonales(
              state.antecedentesPatologicosPersonales!);
        }
        safePrint("if (state.antecedentesObstetricos != null) {");
        if (state.antecedentesObstetricos != null) {
          safePrint("inside if (state.antecedentesObstetricos != null) {");
          AntecedentesObstetricos antecedentesObstetricos = state.antecedentesObstetricos!;
          antecedentesObstetricos.embarazos.removeWhere((e)=>true);
          antecedentesObstetricos.embarazos.addAll(state.embarazoList ?? []);
          List<Embarazo> embarazoList = state.embarazoList ?? [];
          safePrint(embarazoList);
          embarazoList = embarazoList.map((e){
            e.antecedente.target = state.antecedentesObstetricos;
            return e;
          }).toList();
          _objectBox.addEmbarazos(embarazoList);
          _objectBox.addAntecedentesObstetricos(state.antecedentesObstetricos!);
        }
        if (state.geneticaModel != null) {
          _objectBox.addGeneticaModel(state.geneticaModel!);
        }
        if (state.examenFisicoModel != null) {
          _objectBox.addExamenFisico(state.examenFisicoModel!);
        }
        if (state.antecedentesGinecologicos != null) {
          _objectBox
              .addAntecedentesGinecologicos(state.antecedentesGinecologicos!);
        }
        if (state.interrogatorio != null) {
          _objectBox.addInterrogatorio(state.interrogatorio!);
        }
        if (state.signosVitales != null) {
          _objectBox.addSignosVitalesModel(state.signosVitales!);
        }
        if (state.laboratorioMicrobiologiaModel != null) {
          _objectBox.addLaboratorioMicrobiologiaModel(
              state.laboratorioMicrobiologiaModel!);
        }
        if(state.interconsultasModel != null){
          _objectBox.addInterconsultasModel(state.interconsultasModel!);
        }


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
*/
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
    List<FetoUltrasonido1erTrimestre> list =
        List.from(state.fetos1erTrimestre ?? []);
    list[event.index] = event.feto;
    emit(state.copyWith(
      fetos1erTrimestre: list,
    ));
  }

  void _onDeleteFetoUltrasonido1erTrimestre(
      DeleteFetoUltrasonido1erTrimestre event, Emitter<AddPacienteState> emit) {
    List<FetoUltrasonido1erTrimestre> list =
        List.from(state.fetos1erTrimestre ?? []);
    list.removeAt(event.index);
    emit(state.copyWith(
      fetos1erTrimestre: list,
    ));
  }

  void _onDeleteFetoUltrasonidoSeguimiento(
      DeleteFetoUltrasonidoSeguimiento event, Emitter<AddPacienteState> emit) {
    List<FetoUltrasonidoSeguimiento> list =
        List.from(state.fetosSeguimiento ?? []);
    list.removeAt(event.index);
    emit(state.copyWith(
      fetosSeguimiento: list,
    ));
  }

  // Manejador para agregar un nuevo feto
  void _onAddFetoUltrasonido1erTrimestre(
      AddFetoUltrasonido1erTrimestre event, Emitter<AddPacienteState> emit) {
    GeneticaModel geneticaModel = state.geneticaModel ?? GeneticaModel();
      List<FetoUltrasonido1erTrimestre> list =
          List.from(state.fetos1erTrimestre ?? []);
      list.add(event.feto);
      emit(state.copyWith(
        fetos1erTrimestre: list,
        genetica: geneticaModel,
      ));
  }

  void _onAddEmbarazo(AddEmbarazo event, Emitter<AddPacienteState> emit) {
    AntecedentesObstetricos antecedentesObstetricos = state.antecedentesObstetricos ?? AntecedentesObstetricos();
    List<Embarazo> list = List.from(state.embarazoList ?? []);
    list.add(event.model);
    emit(state.copyWith(
      embarazoList: list,
      antecedentesObstetricos: antecedentesObstetricos,
    ));
  }

  void _onUpdateEmbarazo(UpdateEmbarazo event, Emitter<AddPacienteState> emit) {
    AntecedentesObstetricos antecedentesObstetricos = state.antecedentesObstetricos ?? AntecedentesObstetricos();
    List<Embarazo> list = List.from(state.embarazoList ?? []);
    list[event.index] = event.model;
    emit(state.copyWith(
      embarazoList: list,
      antecedentesObstetricos: antecedentesObstetricos,
    ));
  }

  void _onDeleteEmbarazo(DeleteEmbarazo event, Emitter<AddPacienteState> emit) {
    AntecedentesObstetricos antecedentesObstetricos = state.antecedentesObstetricos ?? AntecedentesObstetricos();
    List<Embarazo> list = List.from(state.embarazoList ?? []);
    list.removeAt(event.index);
    emit(state.copyWith(
      embarazoList: list,
      antecedentesObstetricos: antecedentesObstetricos,
    ));
  }

  // Manejador para actualizar los datos de un feto específico
  void _onUpdateFetoUltrasonidoSeguimiento(
      UpdateFetoUltrasonidoSeguimiento event, Emitter<AddPacienteState> emit) {
    List<FetoUltrasonidoSeguimiento> list =
        List.from(state.fetosSeguimiento ?? []);
    list[event.index] = event.feto;
    emit(state.copyWith(
      fetosSeguimiento: list,
    ));
  }

  // Manejador para agregar un nuevo feto
  void _onAddFetoUltrasonidoSeguimiento(
      AddFetoUltrasonidoSeguimiento event, Emitter<AddPacienteState> emit) {
      GeneticaModel geneticaModel = state.geneticaModel ?? GeneticaModel();
      List<FetoUltrasonidoSeguimiento> list =
          List.from(state.fetosSeguimiento ?? []);
      list.add(event.feto);
      emit(state.copyWith(
        fetosSeguimiento: list,
        genetica: geneticaModel,
      ));
  }
}
