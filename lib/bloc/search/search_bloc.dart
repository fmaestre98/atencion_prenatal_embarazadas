import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/database/objectbox.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late final ObjectBox _objectBox;

  SearchBloc(this._objectBox) : super(SearchInitial()) {
    on<TextChanged>(
      _onTextChanged,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  // Transformer para debounce
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  Future<void> _onTextChanged(TextChanged event, Emitter<SearchState> emit) async {
    final query = event.query;

    if (query.length < 2) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final results = _objectBox.getPacientesByNoIdentidad(query);
      emit(SearchSuccess(results: results!));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
