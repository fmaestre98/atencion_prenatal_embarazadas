import 'package:atencion_prenatal_embarazadas/bloc/search/search_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/search/search_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/search/search_state.dart';
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_objectbox.dart';

void main() {
  late MockObjectBox mockObjectBox;
  late SearchBloc searchBloc;

  setUp(() {
    mockObjectBox = MockObjectBox();
    searchBloc = SearchBloc(mockObjectBox);
  });

  tearDown(() {
    searchBloc.close();
  });

  group('SearchBloc', () {
    test('emite SearchInitial como estado inicial', () {
      expect(searchBloc.state, equals(SearchInitial()));
    });

    blocTest<SearchBloc, SearchState>(
      'emite [SearchLoading, SearchSuccess] cuando el TextChanged tiene más de 2 caracteres y encuentra resultados',
      build: () {
        // Simula que el método `getPacientesByNoIdentidad` devuelve una lista de pacientes
        when(mockObjectBox.getPacientesByNoIdentidad(any)).thenReturn([
          Paciente(nombre: 'Paciente1', noIdentidad: '12345'),
          Paciente(nombre: 'Paciente2', noIdentidad: '67890'),
        ]);
        return SearchBloc(mockObjectBox);
      },
      act: (bloc) => bloc.add(TextChanged(query: '12')),
      expect: () => [
        SearchLoading(),
        isA<SearchSuccess>().having((s) => s.results, 'results', [
          isA<Paciente>()
              .having((p) => p.nombre, 'nombre', 'Paciente1')
              .having((p) => p.noIdentidad, 'noIdentidad', '12345'),
          isA<Paciente>()
              .having((p) => p.nombre, 'nombre', 'Paciente2')
              .having((p) => p.noIdentidad, 'noIdentidad', '67890'),
        ]),
      ],
      verify: (_) {
        verify(mockObjectBox.getPacientesByNoIdentidad('12')).called(1);
      },
    );

    blocTest<SearchBloc, SearchState>(
      'emite [SearchInitial] cuando el query tiene menos de 2 caracteres',
      build: () => SearchBloc(mockObjectBox),
      act: (bloc) => bloc.add(const TextChanged(query: '1')),
      expect: () => [SearchInitial()],
    );

    blocTest<SearchBloc, SearchState>(
      'emite [SearchLoading, SearchError] cuando ocurre una excepción en getPacientesByNoIdentidad',
      build: () {
        when(mockObjectBox.getPacientesByNoIdentidad(any))
            .thenThrow(Exception('Error en la búsqueda'));
        return SearchBloc(mockObjectBox);
      },
      act: (bloc) => bloc.add(const TextChanged(query: 'error')),
      expect: () => [
        SearchLoading(),
        const SearchError(message: 'Exception: Error en la búsqueda'),
      ],
      verify: (_) {
        verify(mockObjectBox.getPacientesByNoIdentidad('error')).called(1);
      },
    );
  });
}
