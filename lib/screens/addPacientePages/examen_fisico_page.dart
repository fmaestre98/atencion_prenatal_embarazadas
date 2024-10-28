import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/genetica_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import '../../models/examen_fisico_model.dart';
import 'laboratorio_page.dart';

class ExamenFisicoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();
  final _formKey9 = GlobalKey<FormState>();
  final _formKey10 = GlobalKey<FormState>();
  final _formKey11 = GlobalKey<FormState>();
  final _formKey12 = GlobalKey<FormState>();
  final _formKey13 = GlobalKey<FormState>();
  final _formKey14 = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _examenFisicoGeneralController =
      TextEditingController();
  final TextEditingController _examenEspecificoController =
      TextEditingController();

  // Agrega más controladores según tu modelo

  ExamenFisicoPage({Key? key}) : super(key: key);

  void _submitExamenFisico(BuildContext context) {
   /* if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate() &&
        _formKey7.currentState!.validate() &&
        _formKey8.currentState!.validate() &&
        _formKey9.currentState!.validate() &&
        _formKey10.currentState!.validate() &&
        _formKey11.currentState!.validate() &&
        _formKey12.currentState!.validate() &&
        _formKey13.currentState!.validate() &&
        _formKey14.currentState!.validate()) {*/
      _formKey.currentState!.save();

      context
          .read<AddPacienteBloc>()
          .add(SubmitExamenFisico());
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen Físico'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) => previous.isSuccessExamenFisico != current.isSuccessExamenFisico
            || previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          safePrint(state.isSuccessExamenFisico);
          if (state.isSuccessExamenFisico) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeneticaPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) => previous.examenFisicoModel != current.examenFisicoModel ||
            current.currentStepExamenFisico != previous.currentStepExamenFisico,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepExamenFisico,
              onStepContinue: () {
                if (state.currentStepExamenFisico < 14) {
                  context.read<AddPacienteBloc>().add(
                      UpdateCurrentStepExamenFisico(
                          step: state.currentStepExamenFisico + 1));
                } else {
                  _submitExamenFisico(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepExamenFisico > 0) {
                  context.read<AddPacienteBloc>().add(
                      UpdateCurrentStepExamenFisico(
                          step: state.currentStepExamenFisico - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Examen obstétrico'),
                  isActive: state.currentStepExamenFisico >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.semanasDeGestacion ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      semanasDeGestacion: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Semanas de Gestación'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las semanas de gestación'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.examenFisicoModel?.peso ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel:
                                      examenFisico.copyWith(peso: value),
                                ));
                          },
                          decoration: const InputDecoration(labelText: 'Peso'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el peso'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.alturaUterina ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      alturaUterina: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Altura Uterina'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la altura uterina'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.examenFisicoModel
                                  ?.circunsferenciaAbdominal ??
                              '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      circunsferenciaAbdominal: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Circunferencia Abdominal'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la circunferencia abdominal'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.presentacion ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      presentacion: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Presentación'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presentación'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.examenFisicoModel?.posicion ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel:
                                      examenFisico.copyWith(posicion: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Posición'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la posición'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.focoFetal ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel:
                                      examenFisico.copyWith(focoFetal: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Foco Fetal'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el foco fetal'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.movimientoFetal ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      movimientoFetal: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Movimiento Fetal'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el movimiento fetal'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.tonoUterino ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel:
                                      examenFisico.copyWith(tonoUterino: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Tono Uterino'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa el tono uterino'
                              : null,
                        ),
                        TextFormField(
                          initialValue: state.examenFisicoModel?.edemas ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel:
                                      examenFisico.copyWith(edemas: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Edemas'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la presencia de edemas'
                              : null,
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.dinamicaUterina ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      dinamicaUterina: value),
                                ));
                          },
                          decoration: const InputDecoration(
                              labelText: 'Dinámica Uterina'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa la dinámica uterina'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('General'),
                  isActive: state.currentStepExamenFisico >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Tejido celular subcutáneo',
                            state.examenFisicoModel?.tejidoCelularSubcutaneo,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    tejidoCelularSubcutaneo: value),
                              ));
                        }),
                        _buildRadioGroup('Facies',
                            state.examenFisicoModel?.facies, (value) {
                              var examenFisico = state.examenFisicoModel ??
                                  ExamenFisicoModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    facies: value),
                              ));
                            }),
                        _buildRadioGroup(
                            'Piel', state.examenFisicoModel?.piel, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                            examenFisicoModel: examenFisico.copyWith(
                                piel: value),
                          ));
                        }),
                        _buildRadioGroup('Mucosas',
                            state.examenFisicoModel?.mucosas, (value) {
                              var examenFisico = state.examenFisicoModel ??
                                  ExamenFisicoModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    mucosas: value),
                              ));
                            }),
                        _buildRadioGroup('Faneras',
                            state.examenFisicoModel?.faneras, (value) {
                              var examenFisico = state.examenFisicoModel ??
                                  ExamenFisicoModel(id: 0);
                              context
                                  .read<AddPacienteBloc>()
                                  .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    faneras: value),
                              ));
                            }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.gObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      gObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Respiratorio'),
                  isActive: state.currentStepExamenFisico >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Inspección', state.examenFisicoModel?.rInspeccion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(rInspeccion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Palpación', state.examenFisicoModel?.rPalpacion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(rPalpacion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Percusión', state.examenFisicoModel?.rPercucion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(rPercucion: value),
                              ));
                        }),
                        _buildRadioGroup('Auscultación',
                            state.examenFisicoModel?.rAuscultacion, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(rAuscultacion: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.rObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      rObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Área Cardíaca'),
                  isActive: state.currentStepExamenFisico >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Inspección', state.examenFisicoModel?.acInspeccion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(acInspeccion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Palpación', state.examenFisicoModel?.acPalpacion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(acPalpacion: value),
                              ));
                        }),
                        _buildRadioGroup('Auscultación',
                            state.examenFisicoModel?.acAuscultacion, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    acAuscultacion: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.acObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      acObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Venoso Linfático'),
                  isActive: state.currentStepExamenFisico >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Venoso Periférico',
                            state.examenFisicoModel?.venosoPeriferico, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel: examenFisico.copyWith(
                                    venosoPeriferico: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Linfático', state.examenFisicoModel?.linfatico,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(linfatico: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.vlObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      vlObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Digestivo Superior'),
                  isActive: state.currentStepExamenFisico >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Boca', state.examenFisicoModel?.boca,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(boca: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Lengua', state.examenFisicoModel?.lengua, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(lengua: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Orofaringe', state.examenFisicoModel?.orofaringe,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(orofaringe: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.dsObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      dsObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Abdomen'),
                  isActive: state.currentStepExamenFisico >= 6,
                  content: Form(
                    key: _formKey7,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Inspección', state.examenFisicoModel?.aInspeccion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(aInspeccion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Palpación', state.examenFisicoModel?.aPalpacion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(aPalpacion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Percusión', state.examenFisicoModel?.aPercucion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(aPercucion: value),
                              ));
                        }),
                        _buildRadioGroup('Auscultación',
                            state.examenFisicoModel?.aAuscultacion, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(aAuscultacion: value),
                              ));
                        }),
                        _buildRadioGroup('Tacto Rectal',
                            state.examenFisicoModel?.aTactoRectal, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(aTactoRectal: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.aObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      aObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Urinario'),
                  isActive: state.currentStepExamenFisico >= 7,
                  content: Form(
                    key: _formKey8,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Inspección', state.examenFisicoModel?.uInspeccion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(uInspeccion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Palpación', state.examenFisicoModel?.uPalpacion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(uPalpacion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Percusión', state.examenFisicoModel?.uPercucion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(uPercucion: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.uObservacions ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      uObservacions: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Vulva y Perine'),
                  isActive: state.currentStepExamenFisico >= 8,
                  content: Form(
                    key: _formKey9,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Vulva y Perine',
                            state.examenFisicoModel?.vuelvaPerine, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(vuelvaPerine: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.vObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      vObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Vagina'),
                  isActive: state.currentStepExamenFisico >= 9,
                  content: Form(
                    key: _formKey10,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Vagina', state.examenFisicoModel?.vagina, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(vagina: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.vagObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      vagObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Cuello'),
                  isActive: state.currentStepExamenFisico >= 10,
                  content: Form(
                    key: _formKey11,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Cuello', state.examenFisicoModel?.cuello, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(cuello: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.cObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      cObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Útero'),
                  isActive: state.currentStepExamenFisico >= 11,
                  content: Form(
                    key: _formKey12,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Útero', state.examenFisicoModel?.utero, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(utero: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.utObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      utObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Anejos'),
                  isActive: state.currentStepExamenFisico >= 12,
                  content: Form(
                    key: _formKey13,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Anejos', state.examenFisicoModel?.anejos, (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(anejos: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.anObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      anObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Mamas'),
                  isActive: state.currentStepExamenFisico >= 13,
                  content: Form(
                    key: _formKey14,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Inspección', state.examenFisicoModel?.mInspeccion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(mInspeccion: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Palpación', state.examenFisicoModel?.mPalpacion,
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(mPalpacion: value),
                              ));
                        }),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.mObservaciones ?? '',
                          onChanged: (value) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                                  examenFisicoModel: examenFisico.copyWith(
                                      mObservaciones: value),
                                ));
                          },
                          decoration:
                              const InputDecoration(labelText: 'Observaciones'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Por favor ingresa las observaciones'
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepExamenFisico >= 14,
                  content: const SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRadioGroup(
      String title, String? value, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title:'),
        Column(
          children: [
            RadioListTile<String>(
              title: const Text('Normal'),
              value: 'Normal',
              groupValue: value,
              // Cambia a la variable que almacena el estado actual
              onChanged: onChanged,
            ),
            RadioListTile<String>(
              title: const Text('Anormal'),
              value: 'Anormal',
              groupValue: value,
              // Cambia a la variable que almacena el estado actual
              onChanged: onChanged,
            ),
            RadioListTile<String>(
              title: const Text('NE'),
              value: 'NE',
              groupValue: value,
              // Cambia a la variable que almacena el estado actual
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
