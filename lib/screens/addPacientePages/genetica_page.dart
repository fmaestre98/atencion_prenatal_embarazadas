// lib/screens/genetica_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import '../../models/personal_data_model.dart';
import 'interconsultas_page.dart';

class GeneticaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();


  GeneticaPage({Key? key}) : super(key: key);

  void _submitGenetica(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Crear objeto Genetica (si tienes una entidad separada)
      // Si es parte de Paciente, actualiza el objeto Paciente en el BLoC
      /*Paciente updatedPaciente = state.paciente.copyWith(
        // Añade los campos de genética e imagenología
        // Por ejemplo:
        // estudiosGeneticos: _estudiosGeneticosController.text,
        // imagenologia: _imagenologiaController.text,
      );

      // Enviar evento al BLoC
      context.read<AddPacienteBloc>().add(UpdateDatosPersonales(paciente: updatedPaciente));*/

      // Navegar a la siguiente página (Interconsultas)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InterconsultasPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genética e Imagenología'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listener: (context, state) {
          if (state.isSuccessSignosVitales) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InterconsultasPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.pacienteLoaded) {
            //_updateControllers(state);
          }
        },
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
                  //_submitDatosPersonales(context);
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
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(efhb: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.afp ?? '',
                          decoration: const InputDecoration(labelText: 'AFP'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
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
                        TextFormField(
                          initialValue: state.geneticaModel?.fechaRealizacion?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de realización'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(
                                fechaRealizacion: DateTime.tryParse(value),
                              ),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.numFetos?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Número de fetos'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(
                                numFetos: int.tryParse(value),
                              ),
                            ));
                          },
                        ),
                        // Sección para manejar los fetos de manera dinámica
                        ...?state.geneticaModel?.fetos1erTrimestre.asMap().entries.map((entry) {
                          int index = entry.key;
                          var feto = entry.value;

                          return Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: feto.lc,
                                decoration: const InputDecoration(labelText: 'LC (Feto)'),
                                onChanged: (value) {
                                  context.read<AddPacienteBloc>().add(UpdateFetoUltrasonido1erTrimestre(
                                    index: index,
                                    feto: feto.copyWith(lc: value),
                                  ));
                                },
                              ),
                              TextFormField(
                                initialValue: feto.corion,
                                decoration: const InputDecoration(labelText: 'Corion (Feto)'),
                                onChanged: (value) {
                                  context.read<AddPacienteBloc>().add(UpdateFetoUltrasonido1erTrimestre(
                                    index: index,
                                    feto: feto.copyWith(corion: value),
                                  ));
                                },
                              ),
                              // Agregar más campos según sea necesario para cada feto
                            ],
                          );
                        }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar un nuevo feto
                            var newFeto = FetoUltrasonido1erTrimestre();
                            context.read<AddPacienteBloc>().add(AddFetoUltrasonido1erTrimestre(feto: newFeto));
                          },
                          child: const Text('Agregar Feto'),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Ultrasonido de seguimiento'),
                  isActive: state.currentStepGenetica >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.usFechaRealizacion?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de realización'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(
                                usFechaRealizacion: DateTime.tryParse(value),
                              ),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.usNumFetos?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Número de fetos'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(
                                usNumFetos: int.tryParse(value),
                              ),
                            ));
                          },
                        ),
                        // Sección para manejar los fetos de manera dinámica
                        ...?state.geneticaModel?.fetosSeguimiento.asMap().entries.map((entry) {
                          int index = entry.key;
                          var feto = entry.value;

                          return Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: feto.lc,
                                decoration: const InputDecoration(labelText: 'LC (Feto)'),
                                onChanged: (value) {
                                  context.read<AddPacienteBloc>().add(UpdateFetoUltrasonidoSeguimiento(
                                    index: index,
                                    feto: feto.copyWith(lc: value),
                                  ));
                                },
                              ),
                              TextFormField(
                                initialValue: feto.cc,
                                decoration: const InputDecoration(labelText: 'CC'),
                                onChanged: (value) {
                                  context.read<AddPacienteBloc>().add(UpdateFetoUltrasonidoSeguimiento(
                                    index: index,
                                    feto: feto.copyWith(cc: value),
                                  ));
                                },
                              ),
                              // Agregar más campos según sea necesario para cada feto
                            ],
                          );
                        }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para agregar un nuevo feto
                            var newFeto = FetoUltrasonidoSeguimiento();
                            context.read<AddPacienteBloc>().add(AddFetoUltrasonidoSeguimiento(feto: newFeto));
                          },
                          child: const Text('Agregar Feto'),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cervicometría'),
                  isActive: state.currentStepGenetica >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.longitudDelCuello ?? '',
                          decoration: const InputDecoration(labelText: 'Longitud del Cuello'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(longitudDelCuello: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.oci ?? '',
                          decoration: const InputDecoration(labelText: 'OCI'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(oci: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.valorOci ?? '',
                          decoration: const InputDecoration(labelText: 'Valor OCI'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(valorOci: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.maniobrasEsfuerzo ?? '',
                          decoration: const InputDecoration(labelText: 'Maniobras de Esfuerzo'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(maniobrasEsfuerzo: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.icc ?? '',
                          decoration: const InputDecoration(labelText: 'ICC'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(icc: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.iccPercentil ?? '',
                          decoration: const InputDecoration(labelText: 'ICC Percentil'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(iccPercentil: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.csDatosDeInteres ?? '',
                          decoration: const InputDecoration(labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(csDatosDeInteres: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Doppler Arterias Uterinas'),
                  isActive: state.currentStepGenetica >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.ip1 ?? '',
                          decoration: const InputDecoration(labelText: 'IP1'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(ip1: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipD ?? '',
                          decoration: const InputDecoration(labelText: 'IPD'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(ipD: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipM ?? '',
                          decoration: const InputDecoration(labelText: 'IPM'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(ipM: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.ipmPercentil ?? '',
                          decoration: const InputDecoration(labelText: 'IPM Percentil'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(ipmPercentil: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.dusDatosDeInteres ?? '',
                          decoration: const InputDecoration(labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(dusDatosDeInteres: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cervicometría de Seguimiento'),
                  isActive: state.currentStepGenetica >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: state.geneticaModel?.scfechaRealizacion?.toString() ?? '',
                          decoration: const InputDecoration(labelText: 'Fecha de Realización'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            final fecha = DateTime.tryParse(value); // Convierte el valor de texto a DateTime
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scfechaRealizacion: fecha),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scLongitudCuello ?? '',
                          decoration: const InputDecoration(labelText: 'Longitud del Cuello'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scLongitudCuello: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scOci ?? '',
                          decoration: const InputDecoration(labelText: 'OCI'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scOci: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scValorOci ?? '',
                          decoration: const InputDecoration(labelText: 'Valor OCI'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scValorOci: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scManiobrasEsfuerzo ?? '',
                          decoration: const InputDecoration(labelText: 'Maniobras de Esfuerzo'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scManiobrasEsfuerzo: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scIcc ?? '',
                          decoration: const InputDecoration(labelText: 'ICC'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scIcc: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scIccPercentil ?? '',
                          decoration: const InputDecoration(labelText: 'ICC Percentil'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scIccPercentil: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.eg ?? '',
                          decoration: const InputDecoration(labelText: 'EG'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(eg: value),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue: state.geneticaModel?.scDatosDeInteres ?? '',
                          decoration: const InputDecoration(labelText: 'Datos de Interés'),
                          onChanged: (value) {
                            var genetica = state.geneticaModel ?? GeneticaModel(id: 0);
                            context.read<AddPacienteBloc>().add(UpdateGenetica(
                              model: genetica.copyWith(scDatosDeInteres: value),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
