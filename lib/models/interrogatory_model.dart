import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Interrogatorio {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  // Relación uno a muchos con Seccion
  @Backlink("interrogatorio")
  final secciones = ToMany<Seccion>();

  Interrogatorio({this.id = 0});
}

@Entity()
class Seccion {
  int id; // field auto-incremented
  final interrogatorio = ToOne<Interrogatorio>(); // Relación uno a uno con Interrogatorio

  String nombre; // Nombre de la sección (ej. "Cardiovascular")

  // Relación uno a muchos con Elemento
  @Backlink("seccion")
  final elementos = ToMany<Elemento>();

  // Campo de observaciones
  String? observaciones;

  Seccion({this.id = 0, required this.nombre});
}

@Entity()
class Elemento {
  int id; // field auto-incremented
  final seccion = ToOne<Seccion>(); // Relación uno a uno con Seccion

  String nombre; // Nombre del elemento (ej. "Dolor en el pecho")
  bool? respuesta; // true = Sí, false = No

  Elemento({this.id = 0, required this.nombre});
}