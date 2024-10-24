import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class SignosVitalesModel {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

//datos antropometricos
  double? peso;
  String? talla;
  String? percentilPeso;
  String? indiceMasaCorporal;
  String? valorNutricional;
  double? circunsferenciaAbdominal;

  //tension arterial
  String? sistolica;
  String? diastolica;
  String? media;
  String? postura;
  String? ubicacion;

  //pulso
  String? valor;
  String? caracteristicas;
  String? pulsoUbicacion;

  //frecuencia respiratoria
  String? frValor;
  String? frCarateristicas;

  //temperatura
  String? temperatura;
  String? localizacion;

  //frecuencia cardiaca
  String? fcValor;


  SignosVitalesModel({this.id = 0});

}
