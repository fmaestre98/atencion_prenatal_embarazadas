// test/home_page_test.dart

import 'package:atencion_prenatal_embarazadas/bloc/home/home_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_state.dart';
import 'package:atencion_prenatal_embarazadas/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'home_page_test.mocks.dart';


@GenerateNiceMocks([MockSpec<HomeBloc>()])
void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });

  testWidgets('muestra CircularProgressIndicator cuando está en EmbarazadasLoading', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<HomeBloc>(
          create:(BuildContext context){
            mockHomeBloc = MockHomeBloc();
            when(mockHomeBloc.state).thenReturn(EmbarazadasLoading());
            return mockHomeBloc;
          },
          child: const Scaffold(body: HomeContent()), // Añade un Scaffold aquí
        ),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });

  testWidgets('muestra total de embarazadas cuando está en EmbarazadasLoaded', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<HomeBloc>(
          create:(BuildContext context){
            mockHomeBloc = MockHomeBloc();
            when(mockHomeBloc.state).thenReturn(const EmbarazadasLoaded(total: 5, embarazadas: []));

            return mockHomeBloc;
          },
          child: const Scaffold(body: HomeContent()), // Añade un Scaffold aquí
        ),
      ),
    ));

    expect(find.text('Total de Embarazadas'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('muestra mensaje de error cuando está en EmbarazadasError', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<HomeBloc>(
          create:(BuildContext context){
            mockHomeBloc = MockHomeBloc();
            when(mockHomeBloc.state).thenReturn(const EmbarazadasError(message: 'Error en la carga'));
            return mockHomeBloc;
          },
          child: const Scaffold(body: HomeContent()), // Añade un Scaffold aquí
        ),
      ),
    ));

    expect(find.text('Error: Error en la carga'), findsOneWidget);
  });
}
