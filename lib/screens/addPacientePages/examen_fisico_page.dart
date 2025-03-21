import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_event.dart';
import '../../bloc/add/add_state.dart';
import '../../models/examen_fisico_model.dart';
import '../../router/routes.dart';

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
  final ScrollController _scrollController = ScrollController();

  ExamenFisicoPage({Key? key}) : super(key: key ?? const ValueKey<String>('ExamenFisicoPage'));

  void _submitExamenFisico(BuildContext context) {
    _formKey.currentState!.save();
    context.read<AddPacienteBloc>().add(SubmitExamenFisico());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen Físico'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) =>
            previous.isSuccessExamenFisico != current.isSuccessExamenFisico ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.isSuccessExamenFisico) {
            context.pushReplacement(Routes.routeAddGenetica);
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.examenFisicoModel != current.examenFisicoModel ||
            current.currentStepExamenFisico != previous.currentStepExamenFisico,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              controller: _scrollController,
              type: StepperType.vertical,
              currentStep: state.currentStepExamenFisico,
              onStepContinue: () {
                if (state.currentStepExamenFisico < 14) {
                  bool update = false;
                  if (state.currentStepExamenFisico == 0) {
                    if (_formKey.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey, _scrollController);
                  } else if (state.currentStepExamenFisico == 1) {
                    if (_formKey2.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey2, _scrollController);
                  } else if (state.currentStepExamenFisico == 2) {
                    if (_formKey3.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey3, _scrollController);
                  } else if (state.currentStepExamenFisico == 3) {
                    if (_formKey4.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey4, _scrollController);
                  } else if (state.currentStepExamenFisico == 4) {
                    if (_formKey5.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey5, _scrollController);
                  } else if (state.currentStepExamenFisico == 5) {
                    if (_formKey6.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey6, _scrollController);
                  } else if (state.currentStepExamenFisico == 6) {
                    if (_formKey7.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey7, _scrollController);
                  } else if (state.currentStepExamenFisico == 7) {
                    if (_formKey8.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey8, _scrollController);
                  } else if (state.currentStepExamenFisico == 8) {
                    if (_formKey9.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey9, _scrollController);
                  } else if (state.currentStepExamenFisico == 9) {
                    if (_formKey10.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey10, _scrollController);
                  } else if (state.currentStepExamenFisico == 10) {
                    if (_formKey11.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey11, _scrollController);
                  } else if (state.currentStepExamenFisico == 11) {
                    if (_formKey12.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey12, _scrollController);
                  } else if (state.currentStepExamenFisico == 12) {
                    if (_formKey13.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey13, _scrollController);
                  } else if (state.currentStepExamenFisico == 13) {
                    if (_formKey14.currentState!.validate()) {
                      update = true;
                    }
                    scrollToForm(_formKey14, _scrollController);
                  }
                  if(update){
                    context.read<AddPacienteBloc>().add(
                        UpdateCurrentStepExamenFisico(
                            step: state.currentStepExamenFisico + 1));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Revise los datos ingresados")),
                    );
                  }
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
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.number,
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
                        DropdownButtonFormField<String>(
                          value: state.examenFisicoModel?.presentacion ?? "Cefálico",
                          decoration: const InputDecoration(labelText: 'Presentación'),
                          items: ['Cefálico', 'Pelviano', 'Transverso']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                              examenFisicoModel: examenFisico.copyWith(
                                  presentacion: newValue),
                            ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.examenFisicoModel?.posicion ?? "Dorso izquierdo",
                          decoration: const InputDecoration(labelText: 'Posición'),
                          items: ['Dorso izquierdo', 'Dorso derecho']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                              examenFisicoModel: examenFisico.copyWith(
                                  posicion: newValue),
                            ));
                          },
                        ),
                        TextFormField(
                          initialValue:
                              state.examenFisicoModel?.focoFetal ?? '',
                          keyboardType: TextInputType.number,
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
                        DropdownButtonFormField<String>(
                          value: state.examenFisicoModel?.movimientoFetal ?? "Presente",
                          decoration: const InputDecoration(labelText: 'Movimiento Fetal'),
                          items: ['Presente', 'Ausente', 'Disminuido']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                              examenFisicoModel: examenFisico.copyWith(
                                  movimientoFetal: newValue),
                            ));
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: state.examenFisicoModel?.tonoUterino ?? "Normal",
                          decoration: const InputDecoration(labelText: 'Tono Uterino'),
                          items: ['Normal', 'Aumentado']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            var examenFisico = state.examenFisicoModel ??
                                ExamenFisicoModel(id: 0);
                            context
                                .read<AddPacienteBloc>()
                                .add(UpdateExamenFisico(
                              examenFisicoModel: examenFisico.copyWith(
                                  tonoUterino: newValue),
                            ));
                          },
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
                            state.examenFisicoModel?.tejidoCelularSubcutaneo ?? 'NE',
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
                        _buildRadioGroup(
                            'Facies', state.examenFisicoModel?.facies ?? 'NE', (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(facies: value),
                              ));
                        }),
                        _buildRadioGroup('Piel', state.examenFisicoModel?.piel ?? 'NE',
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(piel: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Mucosas', state.examenFisicoModel?.mucosas ?? 'NE',
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(mucosas: value),
                              ));
                        }),
                        _buildRadioGroup(
                            'Faneras', state.examenFisicoModel?.faneras ?? 'NE',
                            (value) {
                          var examenFisico = state.examenFisicoModel ??
                              ExamenFisicoModel(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateExamenFisico(
                                examenFisicoModel:
                                    examenFisico.copyWith(faneras: value),
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
                            'Inspección', state.examenFisicoModel?.rInspeccion ?? 'NE',
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
                            'Palpación', state.examenFisicoModel?.rPalpacion ?? 'NE',
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
                            'Percusión', state.examenFisicoModel?.rPercucion ?? 'NE',
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
                            state.examenFisicoModel?.rAuscultacion ?? 'NE', (value) {
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
                            'Inspección', state.examenFisicoModel?.acInspeccion ?? 'NE',
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
                            'Palpación', state.examenFisicoModel?.acPalpacion ?? 'NE',
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
                            state.examenFisicoModel?.acAuscultacion ?? 'NE', (value) {
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
                            state.examenFisicoModel?.venosoPeriferico ?? 'NE', (value) {
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
                            'Linfático', state.examenFisicoModel?.linfatico ?? 'NE',
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
                        _buildRadioGroup('Boca', state.examenFisicoModel?.boca ?? 'NE',
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
                            'Lengua', state.examenFisicoModel?.lengua ?? 'NE', (value) {
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
                            'Orofaringe', state.examenFisicoModel?.orofaringe ?? 'NE',
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
                            'Inspección', state.examenFisicoModel?.aInspeccion ?? 'NE',
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
                            'Palpación', state.examenFisicoModel?.aPalpacion ?? 'NE',
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
                            'Percusión', state.examenFisicoModel?.aPercucion ?? 'NE',
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
                            state.examenFisicoModel?.aAuscultacion ?? 'NE', (value) {
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
                            state.examenFisicoModel?.aTactoRectal ?? 'NE', (value) {
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
                            'Inspección', state.examenFisicoModel?.uInspeccion ?? 'NE',
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
                            'Palpación', state.examenFisicoModel?.uPalpacion ?? 'NE',
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
                            'Percusión', state.examenFisicoModel?.uPercucion ?? 'NE',
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
                            state.examenFisicoModel?.vuelvaPerine ?? 'NE', (value) {
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
                            'Vagina', state.examenFisicoModel?.vagina ?? 'NE', (value) {
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
                            'Cuello', state.examenFisicoModel?.cuello ?? 'NE', (value) {
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
                            'Útero', state.examenFisicoModel?.utero ?? 'NE', (value) {
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
                            'Anejos', state.examenFisicoModel?.anejos ?? 'NE', (value) {
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
                            'Inspección', state.examenFisicoModel?.mInspeccion ?? 'NE',
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
                            'Palpación', state.examenFisicoModel?.mPalpacion ?? 'NE',
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
      String title, String value, ValueChanged<String?> onChanged) {
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
