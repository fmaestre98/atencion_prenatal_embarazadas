// lib/bloc/embarazadas_bloc.dart
import 'package:atencion_prenatal_embarazadas/bloc/home/home_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_state.dart';
import 'package:atencion_prenatal_embarazadas/data/database/objectbox.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ObjectBox _objectBoxService = GetIt.instance<ObjectBox>();

  HomeBloc() : super(EmbarazadasInitial()) {
    on<LoadEmbarazadas>(_onLoadEmbarazadas);
  }

  Future<void> _onLoadEmbarazadas(
      LoadEmbarazadas event, Emitter<HomeState> emit) async {
    emit(EmbarazadasLoading());
    try {
      final total = _objectBoxService.countPacientes();
      final embarazadas = _objectBoxService.getLastFivePacientes();
      emit(EmbarazadasLoaded(total: total, embarazadas: embarazadas));
    } catch (e) {
      emit(EmbarazadasError(message: e.toString()));
    }
  }
}
