// lib/screens/interrogatorio_page.dart
import 'package:atencion_prenatal_embarazadas/bloc/add/add_event.dart';
import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/models/interrogatory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add/add_bloc.dart';
import '../../bloc/add/add_state.dart';
import 'signos_vitales_page.dart';

class InterrogatorioPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();


  // Agrega más controladores según tu modelo

  InterrogatorioPage({Key? key}) : super(key: key);

  void _submitInterrogatorio(BuildContext context) {
    if (_formKey.currentState!.validate() &&
        _formKey2.currentState!.validate() &&
        _formKey3.currentState!.validate() &&
        _formKey4.currentState!.validate() &&
        _formKey5.currentState!.validate() &&
        _formKey6.currentState!.validate() &&
        _formKey7.currentState!.validate()) {

      // Enviar evento al BLoC
      context
          .read<AddPacienteBloc>()
          .add(SubmitInterrogatorio());
     safePrint("lkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interrogatorio'),
      ),
      body: BlocConsumer<AddPacienteBloc, AddPacienteState>(
        listenWhen: (previous, current) => previous.isSuccessInterrogatorio != current.isSuccessInterrogatorio
            || previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          safePrint(state.interrogatorio.toString());
          if (state.isSuccessInterrogatorio) {
            // Navegar a la página de Interrogatorio cuando el estado sea exitoso
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignosVitalesPage()),
            );
          } else if (state.errorMessage != null) {
            // Mostrar mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        buildWhen: (previous, current) => previous.interrogatorio != current.interrogatorio ||
            current.currentStepInterrogatorio != previous.currentStepInterrogatorio,
        builder: (context, state) {
          safePrint("called builder interrogatorio");
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: state.currentStepInterrogatorio,
              onStepContinue: () {
                safePrint(state.currentStepInterrogatorio);
                bool update = false;
                if (state.currentStepInterrogatorio < 7) {
                  if(state.currentStepInterrogatorio == 0){
                    if (_formKey.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 1){
                    if (_formKey2.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 2){
                    if (_formKey3.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 3){
                    if (_formKey4.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 4){
                    if (_formKey5.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 5){
                    if (_formKey6.currentState!.validate()){
                      update=true;
                    }
                  } else if(state.currentStepInterrogatorio == 6){
                    if (_formKey7.currentState!.validate()){
                      update=true;
                    }
                  }
                  if(update){
                    context.read<AddPacienteBloc>().add(UpdateCurrentStepInterrogatorio(
                        step: state.currentStepInterrogatorio + 1));
                  }
                } else {
                  safePrint("hereeee befor submit interrogatorio");
                  _submitInterrogatorio(context);
                }
              },
              onStepCancel: () {
                if (state.currentStepInterrogatorio > 0) {
                  context.read<AddPacienteBloc>().add(
                      UpdateCurrentStepInterrogatorio(
                          step: state.currentStepInterrogatorio - 1));
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Sistema respiratorio'),
                  isActive: state.currentStepInterrogatorio >= 0,
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Disnea:', state.interrogatorio?.srDisnea, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srDisnea: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor:', state.interrogatorio?.srDolor, (value) {
                          safePrint(value);
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srDolor: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Hermoptisis:', state.interrogatorio?.srHermoptisis, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srHermoptisis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Expectoración:', state.interrogatorio?.srExpectoracion, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srExpectoracion: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Tos:', state.interrogatorio?.srTos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srTos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:', state.interrogatorio?.srOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    srOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.srObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                srObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sistema cardiovascular'),
                  isActive: state.currentStepInterrogatorio >= 1,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Disnea:', state.interrogatorio?.scDisnea, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scDisnea: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor:', state.interrogatorio?.scDolor, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scDolor: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Claudicación intermitente:', state.interrogatorio?.scClaudicacionIntermitente, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scClaudicacionIntermitente: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Cianosis:', state.interrogatorio?.scCianosis, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scCianosis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Tos:', state.interrogatorio?.scTos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scTos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Palpitaciones:', state.interrogatorio?.scPalpitaciones, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scPalpitaciones: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:', state.interrogatorio?.scOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    scOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.scObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                scObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sistema digestivo'),
                  isActive: state.currentStepInterrogatorio >= 2,
                  content: Form(
                    key: _formKey3,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Disfagia:', state.interrogatorio?.sdDisfagia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdDisfagia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Cólicos:', state.interrogatorio?.sdColicos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdColicos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Hematemesis:', state.interrogatorio?.sdHermatemesis, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdHermatemesis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Acolia:', state.interrogatorio?.sdAcolia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdAcolia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Pirosis:', state.interrogatorio?.sdPirosis, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdPirosis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Náuseas:', state.interrogatorio?.sdNauseas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdNauseas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Enterorragia:', state.interrogatorio?.sdEnterorragia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdEnterorragia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Constipación:', state.interrogatorio?.sdConstipacion, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdConstipacion: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Acidez:', state.interrogatorio?.sdAcidez, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdAcidez: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Diarreas:', state.interrogatorio?.sdDiarreas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdDiarreas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Aerogastrias:', state.interrogatorio?.sdAerogastrias, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdAerogastrias: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor:', state.interrogatorio?.sdDolor, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdDolor: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Vómitos:', state.interrogatorio?.sdVomitos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdVomitos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Melena:',  state.interrogatorio?.sdMelena, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdMelena: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:', state.interrogatorio?.sdOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sdOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.sdObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                sdObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sistema urogenital'),
                  isActive: state.currentStepInterrogatorio >= 3,
                  content: Form(
                    key: _formKey4,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Dolor:', state.interrogatorio?.suDolor, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suDolor: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Nicturias:', state.interrogatorio?.suNicturioas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suNicturioas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Orinas turbias:', state.interrogatorio?.suOrinasTurbias, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suOrinasTurbias: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Exudado uretral:', state.interrogatorio?.suExudadoUretral, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suExudadoUretral: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Disuria:',  state.interrogatorio?.suDisuria, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suDisuria: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Retención urinaria:', state.interrogatorio?.suRetencionUrinaria, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suRetencionUrinaria: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Hermaturia:',  state.interrogatorio?.suHermaturia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suHermaturia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Incontinencia:',  state.interrogatorio?.suIncontinencia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suIncontinencia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Polaquiuria:',  state.interrogatorio?.suPolaquiuria, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suPolaquiuria: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Uretrorragia:',  state.interrogatorio?.suUretorragia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suUretorragia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Impotencia:', state.interrogatorio?.suImpotiencia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suImpotiencia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Tumoración:',  state.interrogatorio?.suTumoracion, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suTumoracion: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Cálculos:',  state.interrogatorio?.suCalculos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suCalculos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:',  state.interrogatorio?.suOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    suOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.suObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                suObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sistema neurológico'),
                  isActive: state.currentStepInterrogatorio >= 4,
                  content: Form(
                    key: _formKey5,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Cefaleas:',  state.interrogatorio?.snCefaleas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snCefaleas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor facial:',  state.interrogatorio?.snDolorFacial, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDolorFacial: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Vómitos:',  state.interrogatorio?.snVomitos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snVomitos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor Cervical:',  state.interrogatorio?.snDolorCervical, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDolorCervical: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Vértigos:', state.interrogatorio?.snVertigos, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snVertigos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dolor lumbar:',  state.interrogatorio?.snDolorLumbar, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDolorLumbar: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Convulsiones:',  state.interrogatorio?.snConvulsiones, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snConvulsiones: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Alteración marcha:', state.interrogatorio?.snAlteracionMarcha, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snAlteracionMarcha: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Déficit motor:', state.interrogatorio?.snDefictMotor, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDefictMotor: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Alteración equilibrio:',  state.interrogatorio?.snAlteracionEquilibrio, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snAlteracionEquilibrio: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Déficit sensitivo:', state.interrogatorio?.snDeficitSensitivo, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDeficitSensitivo: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Alteración visual:', state.interrogatorio?.snAlteracionVisual, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snAlteracionVisual: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Alteración conciencia:', state.interrogatorio?.snAlteracionConciencia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snAlteracionConciencia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Dificultad de hablar y entender:',
                            state.interrogatorio?.snDificultadHablarEntender,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snDificultadHablarEntender: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:',  state.interrogatorio?.snOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    snOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.snObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                snObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Sistema endocrino'),
                  isActive: state.currentStepInterrogatorio >= 5,
                  content: Form(
                    key: _formKey6,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup('Hipófisis:', state.interrogatorio?.seHipofisis, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seHipofisis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Ovarios:', state.interrogatorio?.seOvarios, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seOvarios: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Páncreas:', state.interrogatorio?.sePancreas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    sePancreas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Suprarrenal:', state.interrogatorio?.seSuprarrenal, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seSuprarrenal: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Paratiroideas:', state.interrogatorio?.seParatiroideas, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seParatiroideas: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Tiroides:', state.interrogatorio?.seTiroides,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seTiroides: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Testículos:', state.interrogatorio?.seTesticulos,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seTesticulos: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Otros:', state.interrogatorio?.seOtros, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    seOtros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.seObservaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                seObservaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Otros datos'),
                  isActive: state.currentStepInterrogatorio >= 6,
                  content: Form(
                    key: _formKey7,
                    child: Column(
                      children: <Widget>[
                        _buildRadioGroup(
                            'Astenia:', state.interrogatorio?.astenia, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    astenia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Anorexia:', state.interrogatorio?.anorexia,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    anorexia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Epistaxis:', state.interrogatorio?.epistaxis,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    epistaxis: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Fiebre:', state.interrogatorio?.fiebre, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    fiebre: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Artragia:', state.interrogatorio?.artralgia,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    artralgia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Polifagia:', state.interrogatorio?.polifagia,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    polifagia: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Edema:', state.interrogatorio?.edema,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    edema: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup(
                            'Prurito:', state.interrogatorio?.prurito, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    prurito: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Pérdida de peso:',
                            state.interrogatorio?.perdidaPeso, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    perdidaPeso: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Ganancia de peso:',
                            state.interrogatorio?.gananciaPeso, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    gananciaPeso: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Acroparentésias:',
                            state.interrogatorio?.acroparentesias, (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    acroparentesias: value == 'Sí'),
                              ));
                        }),
                        _buildRadioGroup('Otros:', state.interrogatorio?.otros,
                            (value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                                interrogatorio: interrogatorio.copyWith(
                                    otros: value == 'Sí'),
                              ));
                        }),
                        _buildObservationField(state.interrogatorio?.observaciones,(value) {
                          var interrogatorio =
                              state.interrogatorio ?? Interrogatorio(id: 0);
                          context
                              .read<AddPacienteBloc>()
                              .add(UpdateInterrogatorio(
                            interrogatorio: interrogatorio.copyWith(
                                observaciones: value),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Guardar'),
                  isActive: state.currentStepInterrogatorio >= 7,
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
      String question, bool? value, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        Row(
          children: [
            Radio<String>(
              toggleable: true,
              value: 'Sí',
              groupValue: _getValueFromBool(value),
              onChanged: onChanged,
            ),
            const Text('Sí'),
            Radio<String>(
              toggleable: true,
              value: 'No',
              groupValue: _getValueFromBool(value),
              onChanged: onChanged,
            ),
            const Text('No'),
          ],
        ),
      ],
    );
  }

  Widget _buildObservationField(String? initialValue, Function(String?) onChanged ) {
    return TextFormField(
      initialValue: initialValue,
      decoration: const InputDecoration(
        labelText: 'Observaciones',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      onChanged: onChanged,

    );
  }

  String? _getValueFromBool(bool? value) {
    return value == true ? 'Sí' : (value == false ? 'No' : null);
  }
}
