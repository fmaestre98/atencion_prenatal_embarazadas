import 'package:atencion_prenatal_embarazadas/bloc/search/search_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/search/search_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/search/search_state.dart';
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:atencion_prenatal_embarazadas/screens/search_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchBloc>()])
void main() {
  group('SearchPage tests', () {
    late MockSearchBloc mockBloc;

    setUp(() {
      mockBloc = MockSearchBloc();
    });

    testWidgets('muestra el mensaje inicial cuando el estado es SearchInitial', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<SearchBloc>(
              create:(BuildContext context){
                mockBloc = MockSearchBloc();
                when(mockBloc.state).thenReturn(SearchInitial());
                return mockBloc;
              },
              child: Scaffold(body: SearchPageChild()), // Añade un Scaffold aquí
              ),
          ),
          ),
      );

      await tester.pump();

      expect(find.text('Introduce al menos 2 caracteres para buscar.'), findsOneWidget);
    });


    testWidgets('muestra resultados de búsqueda cuando el estado es SearchSuccess', (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(SearchSuccess(results: [
        Paciente(nombre: 'Paciente1', noIdentidad: '12345'),
        Paciente(nombre: 'Paciente2', noIdentidad: '67890'),
      ]));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<SearchBloc>(
              create:(BuildContext context){
                mockBloc = MockSearchBloc();
                when(mockBloc.state).thenReturn(SearchSuccess(results: [
                  Paciente(nombre: 'Paciente1', noIdentidad: '12345'),
                  Paciente(nombre: 'Paciente2', noIdentidad: '67890'),
                ]));
                return mockBloc;
              },
              child: Scaffold(body: SearchPageChild()), // Añade un Scaffold aquí
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Paciente1'), findsOneWidget);
      expect(find.text('No. Identidad: 12345'), findsOneWidget);
      expect(find.text('Paciente2'), findsOneWidget);
      expect(find.text('No. Identidad: 67890'), findsOneWidget);
    });

    testWidgets('muestra mensaje de no resultados cuando la búsqueda no encuentra resultados', (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(SearchSuccess(results: []));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<SearchBloc>(
              create:(BuildContext context){
                mockBloc = MockSearchBloc();
                when(mockBloc.state).thenReturn(SearchSuccess(results: []));
                return mockBloc;
              },
              child: Scaffold(body: SearchPageChild()), // Añade un Scaffold aquí
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('No se encontraron resultados.'), findsOneWidget);
    });

 testWidgets('muestra mensaje de error cuando el estado es SearchError', (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(SearchError(message: 'Error al buscar'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<SearchBloc>(
              create:(BuildContext context){
                mockBloc = MockSearchBloc();
                when(mockBloc.state).thenReturn(SearchError(message: 'Error al buscar'));
                return mockBloc;
              },
              child: Scaffold(body: SearchPageChild()), // Añade un Scaffold aquí
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Error: Error al buscar'), findsOneWidget);
    });
  });
}
