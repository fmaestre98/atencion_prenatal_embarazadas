
import 'package:atencion_prenatal_embarazadas/bloc/home/home_bloc.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_event.dart';
import 'package:atencion_prenatal_embarazadas/bloc/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadEmbarazadas()),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Resumen Total de Embarazadas
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.pregnant_woman, size: 40, color: Colors.pink),
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
            // Lista de Últimas Embarazadas Registradas
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Últimas Embarazadas Registradas',
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
                            return const Center(child: Text('No hay embarazadas registradas.'));
                          }
                          return ListView.builder(
                            itemCount: state.embarazadas.length,
                            itemBuilder: (context, index) {
                              final embarazada = state.embarazadas[index];
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text(embarazada.nombre[0].toUpperCase()),
                                  ),
                                  title: Text(embarazada.nombre),
                                  subtitle: Text(
                                    'Registrada el: ${embarazada.fechaDeRegistro.toLocal().toString().split(' ')[0]}',
                                  ),
                                  onTap: () {
                                    // Navegar a detalles o editar
                                  },
                                ),
                              );
                            },
                          );
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
