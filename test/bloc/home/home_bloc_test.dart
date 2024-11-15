// test/home_bloc_test.dart

import 'package:atencion_prenatal_embarazadas/bloc/home/home_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_objectbox.dart';


// test/home_bloc_test.dart

void main() {
  late MockObjectBox mockObjectBox;
  late HomeBloc homeBloc;

  setUp(() {
    mockObjectBox = MockObjectBox();
    homeBloc = HomeBloc(mockObjectBox);  // Aquí pasamos el mock
  });

  tearDown(() {
    homeBloc.close();
  });

  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emite [EmbarazadasLoading, EmbarazadasLoaded] cuando LoadEmbarazadas es añadido y la carga es exitosa',
      setUp: () {
        when(mockObjectBox.countPacientes()).thenReturn(5);
        when(mockObjectBox.getLastFivePacientes()).thenReturn([]);
      },
      build: () => homeBloc,
      act: (bloc) => bloc.add(LoadEmbarazadas()),
      expect: () => [
        EmbarazadasLoading(),
        const EmbarazadasLoaded(total: 5, embarazadas: []),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emite [EmbarazadasLoading, EmbarazadasError] cuando LoadEmbarazadas arroja una excepción',
      setUp: () {
        when(mockObjectBox.countPacientes()).thenThrow(Exception('Error en la base de datos'));
      },
      build: () => homeBloc,
      act: (bloc) => bloc.add(LoadEmbarazadas()),
      expect: () => [
        EmbarazadasLoading(),
        const EmbarazadasError(message: 'Exception: Error en la base de datos'),
      ],
    );
  });
}

