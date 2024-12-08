import 'package:atencion_prenatal_embarazadas/bloc/home/home_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../data/database/objectbox.dart';
import '../router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(key: key ?? const ValueKey<String>('HomePage'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(GetIt.instance<ObjectBox>())..add(LoadEmbarazadas()),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          // Resumen Total de Embarazadas
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.pregnant_woman,
                  size: 40, color: Colors.pink),
              title: const Text(
                'Total de Embarazadas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is EmbarazadasLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is EmbarazadasLoaded) {
                    return Text(
                      '${state.total}',
                      style: const TextStyle(fontSize: 24, color: Colors.pink),
                    );
                  } else if (state is EmbarazadasError) {
                    return const Icon(Icons.error, color: Colors.red);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Lista de Últimas Embarazadas Registradas con RefreshIndicator
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Últimas 5 Embarazadas Registradas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is EmbarazadasLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is EmbarazadasLoaded) {
                        if (state.embarazadas.isEmpty) {
                          return RefreshIndicator(
                            onRefresh: () async {
                              context.read<HomeBloc>().add(LoadEmbarazadas());
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                            },
                            child: const Center(
                                child: Text('No hay embarazadas registradas.')),
                          );
                        }
                        return RefreshIndicator(
                            onRefresh: () async {
                              context.read<HomeBloc>().add(LoadEmbarazadas());
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                            },
                            child: ListView.builder(
                              itemCount: state.embarazadas.length,
                              itemBuilder: (context, index) {
                                final embarazada = state.embarazadas[index];
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                          embarazada.nombre?[0].toUpperCase() ??
                                              ""),
                                    ),
                                    title: Text(embarazada.nombre ?? ""),
                                    subtitle: Text(
                                      'Registrada el: ${embarazada.fechaDeRegistro?.toLocal().toString().split(' ')[0]}',
                                    ),
                                    onTap: () {
                                      context.go(Routes.addPage,
                                          extra: embarazada.id);
                                    },
                                  ),
                                );
                              },
                            ));
                      } else if (state is EmbarazadasError) {
                        return Center(
                          child: Text(
                            'Error: ${state.message}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Nota para el usuario
                const Center(
                  child: Text(
                    'Desliza hacia abajo para actualizar los datos.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
