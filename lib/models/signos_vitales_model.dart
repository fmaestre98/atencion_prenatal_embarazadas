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

  SignosVitalesModel({
      this.id = 0,
      this.peso,
      this.talla,
      this.percentilPeso,
      this.indiceMasaCorporal,
      this.valorNutricional,
      this.circunsferenciaAbdominal,
      this.sistolica,
      this.diastolica,
      this.media,
      this.postura,
      this.ubicacion,
      this.valor,
      this.caracteristicas,
      this.pulsoUbicacion,
      this.frValor,
      this.frCarateristicas,
      this.temperatura,
      this.localizacion,
      this.fcValor});

  SignosVitalesModel copyWith({
    int? id,
    double? peso,
    String? talla,
    String? percentilPeso,
    String? indiceMasaCorporal,
    String? valorNutricional,
    double? circunsferenciaAbdominal,
    String? sistolica,
    String? diastolica,
    String? media,
    String? postura,
    String? ubicacion,
    String? valor,
    String? caracteristicas,
    String? pulsoUbicacion,
    String? frValor,
    String? frCarateristicas,
    String? temperatura,
    String? localizacion,
    String? fcValor,
  }) {
    return SignosVitalesModel(
      id: id ?? this.id,
      peso: peso ?? this.peso,
      talla: talla ?? this.talla,
      percentilPeso: percentilPeso ?? this.percentilPeso,
      indiceMasaCorporal: indiceMasaCorporal ?? this.indiceMasaCorporal,
      valorNutricional: valorNutricional ?? this.valorNutricional,
      circunsferenciaAbdominal: circunsferenciaAbdominal ?? this.circunsferenciaAbdominal,
      sistolica: sistolica ?? this.sistolica,
      diastolica: diastolica ?? this.diastolica,
      media: media ?? this.media,
      postura: postura ?? this.postura,
      ubicacion: ubicacion ?? this.ubicacion,
      valor: valor ?? this.valor,
      caracteristicas: caracteristicas ?? this.caracteristicas,
      pulsoUbicacion: pulsoUbicacion ?? this.pulsoUbicacion,
      frValor: frValor ?? this.frValor,
      frCarateristicas: frCarateristicas ?? this.frCarateristicas,
      temperatura: temperatura ?? this.temperatura,
      localizacion: localizacion ?? this.localizacion,
      fcValor: fcValor ?? this.fcValor,
    );
  }
}
