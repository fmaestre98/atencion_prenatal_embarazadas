import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/database/objectbox.dart';
import 'add_event.dart';
import 'add_state.dart';

class AddPacienteBloc extends Bloc<AddPacienteEvent, AddPacienteState> {
  final ObjectBox _objectBox = GetIt.instance<ObjectBox>();

  AddPacienteBloc() : super(const AddPacienteState()) {
    on<UpdateDatosPersonales>(_onUpdateDatosPersonales);
    on<UpdateInterrogatorio>(_onUpdateInterrogatorio);
    // Maneja otros eventos similares...

    on<SubmitPaciente>(_onSubmitPaciente);
  }

  void _onUpdateDatosPersonales(
      UpdateDatosPersonales event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(paciente: event.paciente));
  }

  void _onUpdateInterrogatorio(
      UpdateInterrogatorio event, Emitter<AddPacienteState> emit) {
    emit(state.copyWith(interrogatorio: event.interrogatorio));
  }

  // Implementa métodos para manejar otros eventos...

  Future<void> _onSubmitPaciente(
      SubmitPaciente event, Emitter<AddPacienteState> emit) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      // Asume que ya has llenado todas las secciones necesarias
      // Aquí puedes validar que todas las secciones estén llenas

      // Guarda los datos de Paciente
      if(state.paciente != null){
        _objectBox.addPaciente(state.paciente!);
        // Si hay interrogatorio, asócialo con el Paciente this dont make sense
        /* if (state.interrogatorio != null) {
        state.interrogatorio!.paciente.target = _objectBox.pacienteBox.get(pacienteId);
        _objectBox.interrogatorioBox.put(state.interrogatorio!);
      }*/

        // Guarda otras secciones similares...
      }
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
