import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/router/destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/add/add_bloc.dart';
import '../router/routes.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) {
              safePrint("index $index");
              if(index != 2){
                final bloc = context.read<AddPacienteBloc>();
                bloc.add(const ClearPacienteData());
              } else {
                // Asegúrate de que el estado extra no quede pegado al volver a esta ruta.
                context.go(Routes.addPage, extra: null);
              }
              navigationShell.goBranch(index, initialLocation: true);
            },
            destinations: destinations
                .map((destination) => NavigationDestination(
                      icon: Icon(destination.icon),
                      label: destination.label,
                      selectedIcon: Icon(
                        destination.icon,
                        color: Colors.white,
                      ),
                    ))
                .toList()),
      );
}
