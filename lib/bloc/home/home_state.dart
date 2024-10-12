// lib/bloc/embarazadas_state.dart
import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class EmbarazadasInitial extends HomeState {}

class EmbarazadasLoading extends HomeState {}

class EmbarazadasLoaded extends HomeState {
  final int total;
  final List<Paciente> embarazadas;

  const EmbarazadasLoaded({required this.total, required this.embarazadas});

  @override
  List<Object> get props => [total, embarazadas];
}

class EmbarazadasError extends HomeState {
  final String message;

  const EmbarazadasError({required this.message});

  @override
  List<Object> get props => [message];
}
