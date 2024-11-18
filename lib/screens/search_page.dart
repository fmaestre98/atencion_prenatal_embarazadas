// lib/screens/search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../bloc/search/search_bloc.dart';
import '../bloc/search/search_event.dart';
import '../bloc/search/search_state.dart';
import '../data/database/objectbox.dart';
import '../router/routes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key})
      : super(key: key ?? const ValueKey<String>('SearchPage'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(GetIt.instance<ObjectBox>()),
      child: const SearchPageChild(),
    );
  }
}

class SearchPageChild extends StatelessWidget {
  const SearchPageChild({Key? key})
      : super(key: key ?? const ValueKey<String>('AddPageChild'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          // Campo de búsqueda
          TextField(
            maxLines: 1,
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Buscar por No. Identidad',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              context.read<SearchBloc>().add(TextChanged(query: query));
            },
          ),
          SizedBox(height: 20),
          // Resultados de búsqueda
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center(
                    child: Text('Introduce al menos 2 caracteres para buscar.'),
                  );
                } else if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  if (state.results.isEmpty) {
                    return const Center(
                        child: Text('No se encontraron resultados.'));
                  }
                  return ListView.builder(
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final paciente = state.results[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child:
                                Text(paciente.nombre?[0].toUpperCase() ?? ""),
                          ),
                          title: Text(paciente.nombre ?? ""),
                          subtitle:
                              Text('No. Identidad: ${paciente.noIdentidad}'),
                          onTap: () {
                            context.go(Routes.addPage,
                                extra: paciente.id);

                          },
                        ),
                      );
                    },
                  );
                } else if (state is SearchError) {
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
    );
  }
}
