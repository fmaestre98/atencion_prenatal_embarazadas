// lib/screens/genetica_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/laboratorio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';

class GeneticaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();

  GeneticaPage({Key? key}) : super(key: key);

  void _submitGenetica(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AddPacienteBloc>().add(SubmitGenetica());
    }
  }

  void _selectDateTime(
      BuildContext context, Null Function(dynamic value) onChange) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Actualiza la fecha de nacimiento
      print("my-logs $picked");
      onChange(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genética e Imagenología'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccessGenetica != current.isSuccessGenetica,
        listener: (context, state) {
          if (state.isSuccessGenetica) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LaboratorioPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) => previous.currentStepGenetica != current.currentStepGenetica ||
        previous.geneticaModel != current.geneticaModel || previous.fetosSeguimiento != current.fetosSeguimiento ||
        previous.fetos1erTrimestre != current.fetos1erTrimestre,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepGenetica,
              onStepContinue: () {
                if (state.currentStepGenetica < 6) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepGenetica(
                      step: state.currentStepGenetica + 1));
                } else {
                  _submitGenetica(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepGenetica > 0) {
                  context.read<AddPacienteBloc>().add(UpdateCurrentStepGenetica(
                      step: state.currentStepGenetica - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Datos genética'),
                  isActive: state.currentStepGenetica >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.efhb ?? '',
                          decoration: const InputDecoration(labelText: 'EFHB'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(efhb: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.afp ?? '',
                          decoration: const InputDecoration(labelText: 'AFP'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(afp: value),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Ultrasonido 1er trimestre'),
                  isActive: state.currentStepGenetica >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.geneticaModel?.fechaRealizacion == null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.geneticaModel?.fechaRealizacion!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime(context, (value) {
                                var genetica =
                                    state.geneticaModel ?? GeneticaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateGenetica(
                                      model: genetica.copyWith(
                                        fechaRealizacion: value,
                                      ),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.numFetos?.toString() ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Número de fetos'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                    numFetos: int.tryParse(value),
                                  ),
                                ));
                          },
                        ),
                        // Sección para manejar los fetos de manera dinámica
                        if (state.fetos1erTrimestre != null)
                          ...state.fetos1erTrimestre!
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            var feto = entry.value;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Feto ${index + 1}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        // Lógica para eliminar el feto
                                        context.read<AddPacienteBloc>().add(
                                            DeleteFetoUltrasonido1erTrimestre(
                                                index: index));
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  initialValue: feto.lc,
                                  decoration: const InputDecoration(
                                      labelText: 'LC (Feto)'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(lc: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.corion,
                                  decoration: const InputDecoration(
                                      labelText: 'Corion (Feto)'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(corion: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.tn,
                                  decoration:
                                      const InputDecoration(labelText: 'TN'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(tn: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.cuatroMiembros,
                                  decoration: const InputDecoration(
                                      labelText: '4 Miembros'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(
                                              cuatroMiembros: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.estomago,
                                  decoration: const InputDecoration(
                                      labelText: 'Estomago'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(estomago: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.paa,
                                  decoration:
                                      const InputDecoration(labelText: 'PAA'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonido1erTrimestre(
                                          index: index,
                                          feto: feto.copyWith(paa: value),
                                        ));
                                  },
                                ),
                                // Agregar más campos según sea necesario para cada feto
                                const Divider(),
                              ],
                            );
                          }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar un nuevo feto
                            var newFeto = FetoUltrasonido1erTrimestre();
                            context.read<AddPacienteBloc>().add(
                                AddFetoUltrasonido1erTrimestre(feto: newFeto));
                          },
                          child: const Text('Agregar Feto'),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Ultrasonido de seguimiento'),
                  isActive: state.currentStepGenetica >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.geneticaModel?.usFechaRealizacion == null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.geneticaModel?.usFechaRealizacion!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime(context, (value) {
                                var genetica =
                                    state.geneticaModel ?? GeneticaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateGenetica(
                                      model: genetica.copyWith(
                                        usFechaRealizacion: value,
                                      ),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.usNumFetos?.toString() ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Número de fetos'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                    usNumFetos: int.tryParse(value),
                                  ),
                                ));
                          },
                        ),
                        // Sección para manejar los fetos de manera dinámica
                        if (state.fetosSeguimiento != null)
                          ...state.fetosSeguimiento!
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            var feto = entry.value;

                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Feto ${index + 1}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        // Lógica para eliminar el feto
                                        context.read<AddPacienteBloc>().add(
                                            DeleteFetoUltrasonidoSeguimiento(
                                                index: index));
                                      },
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  initialValue: feto.lc,
                                  decoration: const InputDecoration(
                                      labelText: 'LC (Feto)'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(lc: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.cc,
                                  decoration:
                                      const InputDecoration(labelText: 'CC'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(cc: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.cordon3Vasos,
                                  decoration: const InputDecoration(
                                      labelText: '3 Vasos'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(
                                              cordon3Vasos: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.vejiga,
                                  decoration: const InputDecoration(
                                      labelText: 'Vejiga'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(vejiga: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.estomago,
                                  decoration: const InputDecoration(
                                      labelText: 'Estomago'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(estomago: value),
                                        ));
                                  },
                                ),
                                TextFormField(
                                  initialValue: feto.columna,
                                  decoration: const InputDecoration(
                                      labelText: 'Columna'),
                                  onChanged: (value) {
                                    context
                                        .read<AddPacienteBloc>()
                                        .add(UpdateFetoUltrasonidoSeguimiento(
                                          index: index,
                                          feto: feto.copyWith(columna: value),
                                        ));
                                  },
                                ),
                                const Divider(),
                                // Agregar más campos según sea necesario para cada feto
                              ],
                            );
                          }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar un nuevo feto
                            var newFeto = FetoUltrasonidoSeguimiento();
                            context.read<AddPacienteBloc>().add(
                                AddFetoUltrasonidoSeguimiento(feto: newFeto));
                          },
                          child: const Text('Agregar Feto'),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cervicometría'),
                  isActive: state.currentStepGenetica >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.longitudDelCuello ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Longitud del Cuello'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      longitudDelCuello: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.oci ?? '',
                          decoration: const InputDecoration(labelText: 'OCI'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(oci: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.valorOci ?? '',
                          decoration:
                              const InputDecoration(labelText: 'Valor OCI'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(valorOci: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.maniobrasEsfuerzo ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Maniobras de Esfuerzo'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      maniobrasEsfuerzo: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.icc ?? '',
                          decoration: const InputDecoration(labelText: 'ICC'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(icc: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.iccPercentil ?? '',
                          decoration:
                              const InputDecoration(labelText: 'ICC Percentil'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(iccPercentil: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.csDatosDeInteres ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      csDatosDeInteres: value),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Doppler Arterias Uterinas'),
                  isActive: state.currentStepGenetica >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.ip1 ?? '',
                          decoration: const InputDecoration(labelText: 'IP1'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(ip1: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipD ?? '',
                          decoration: const InputDecoration(labelText: 'IPD'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(ipD: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipM ?? '',
                          decoration: const InputDecoration(labelText: 'IPM'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(ipM: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipmPercentil ?? '',
                          decoration:
                              const InputDecoration(labelText: 'IPM Percentil'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(ipmPercentil: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.dusDatosDeInteres ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      dusDatosDeInteres: value),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cervicometría de Seguimiento'),
                  isActive: state.currentStepGenetica >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.geneticaModel?.scfechaRealizacion == null
                                    ? 'Fecha de realización'
                                    : 'Fecha: ${state.geneticaModel?.scfechaRealizacion!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _selectDateTime(context, (value) {
                                var genetica =
                                    state.geneticaModel ?? GeneticaModel(id: 0);
                                context
                                    .read<AddPacienteBloc>()
                                    .add(UpdateGenetica(
                                      model: genetica.copyWith(
                                        scfechaRealizacion: value,
                                      ),
                                    ));
                              }),
                              child: const Text('Seleccionar'),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.scLongitudCuello ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Longitud del Cuello'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      scLongitudCuello: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scOci ?? '',
                          decoration: const InputDecoration(labelText: 'OCI'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(scOci: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scValorOci ?? '',
                          decoration:
                              const InputDecoration(labelText: 'Valor OCI'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(scValorOci: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.scManiobrasEsfuerzo ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Maniobras de Esfuerzo'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      scManiobrasEsfuerzo: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scIcc ?? '',
                          decoration: const InputDecoration(labelText: 'ICC'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(scIcc: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.scIccPercentil ?? '',
                          decoration:
                              const InputDecoration(labelText: 'ICC Percentil'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model:
                                      genetica.copyWith(scIccPercentil: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.eg ?? '',
                          decoration: const InputDecoration(labelText: 'EG'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(eg: value),
                                ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.geneticaModel?.scDatosDeInteres ?? '',
                          decoration: const InputDecoration(
                              labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica =
                                state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                                  model: genetica.copyWith(
                                      scDatosDeInteres: value),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepGenetica >= 6,
                  content: const SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
