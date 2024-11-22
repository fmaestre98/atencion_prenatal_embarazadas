import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/router/routes.dart';
import 'package:atencion_prenatal_embarazadas/screens/home_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/layout_scaffold.dart';
import 'package:atencion_prenatal_embarazadas/screens/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/add/add_bloc.dart';
import '../bloc/add/add_event.dart';
import '../screens/addPacientePages/add_paciente_intermediate_page.dart';
import '../screens/addPacientePages/datos_personales_page.dart';
import '../screens/addPacientePages/examen_fisico_page.dart';
import '../screens/addPacientePages/genetica_page.dart';
import '../screens/addPacientePages/interconsultas_page.dart';
import '../screens/addPacientePages/interrogatorios_page.dart';
import '../screens/addPacientePages/laboratorio_page.dart';
import '../screens/addPacientePages/resumen_atencion_page.dart';
import '../screens/addPacientePages/signos_vitales_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homePage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => BlocProvider(
          create: (context) {
            return AddPacienteBloc();
          },
          child: LayoutScaffold(navigationShell: navigationShell)),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.homePage,
              builder: (context, state) => const HomePage()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.searchPage,
              builder: (context, state) => const SearchPage()),
        ]),
        StatefulShellBranch(initialLocation: Routes.addPage, routes: [
          GoRoute(
            path: Routes.addPage,
            builder: (context, state) {
              safePrint("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
              safePrint(state.extra);
              if(state.extra != null){
                final bloc = context.read<AddPacienteBloc>();
                bloc.add(LoadPacienteData(pacienteId: state.extra as int));
              }
              return const AddPacienteIntermediatePage();
            },
            routes: [
              // Envuelve las subrutas en un BlocProvider
              GoRoute(
                path: Routes.addDatosPersonales,
                builder: (context, state) => DatosPersonalesPage(),
              ),
              GoRoute(
                path: Routes.addInterrogatorio,
                builder: (context, state) => InterrogatorioPage(),
              ),
              GoRoute(
                path: Routes.addSignosVitales,
                builder: (context, state) => SignosVitalesPage(),
              ),
              GoRoute(
                path: Routes.addExamenFisico,
                builder: (context, state) => ExamenFisicoPage(),
              ),
              GoRoute(
                path: Routes.addLaboratorio,
                builder: (context, state) => LaboratorioPage(),
              ),
              GoRoute(
                path: Routes.addGenetica,
                builder: (context, state) => GeneticaPage(),
              ),
              GoRoute(
                path: Routes.addInterconsultas,
                builder: (context, state) => InterconsultasPage(),
              ),
              GoRoute(
                path: Routes.addResumenAtencion,
                builder: (context, state) => ResumenAtencionPage(),
              ),
            ],
          ),
        ]),
      ],
    ),
  ],
);
