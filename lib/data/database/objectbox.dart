// lib/objectbox.dart
import 'package:atencion_prenatal_embarazadas/core/utils.dart';
import 'package:atencion_prenatal_embarazadas/models/genetica_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interconsultas_model.dart';
import 'package:atencion_prenatal_embarazadas/models/interrogatory_model.dart';
import 'package:atencion_prenatal_embarazadas/models/laboratorio_microbiologia_model.dart';
import 'package:atencion_prenatal_embarazadas/models/signos_vitales_model.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:atencion_prenatal_embarazadas/objectbox.g.dart';

import '../../models/examen_fisico_model.dart'; // created by `dart run build_runner build`

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  /// A Box of Paciente.
  late final Box<Paciente> _pacienteBox;
  late final Box<EmbarazoActual> _embarazoActual;
  late final Box<AntecedentesPatologicosPersonales> _antecedentesPatologicosBox;
  late final Box<AntecedentesGinecologicos> _antecedentesGinecologicosBox;
  late final Box<AntecedentesObstetricos> _antecedentesObstetricosBox;
  late final Box<Interrogatorio> _interrogatorioBox;
  late final Box<SignosVitalesModel> _signosVitalesBox;
  late final Box<ExamenFisicoModel> _examenFisicoBox;
  late final Box<InterconsultasModel> _interconsultasBox;
  late final Box<GeneticaModel> _geneticaBox;
  late final Box<LaboratorioMicrobiologiaModel> _laboratorioBox;
  late final Box<Embarazo> _embarazoBox;
  late final Box<RecienNacido> _recienNacidoBox;


  ObjectBox._create(this._store) {
    _pacienteBox = Box<Paciente>(_store);
    _embarazoActual = Box<EmbarazoActual>(_store);
    _antecedentesPatologicosBox = Box<AntecedentesPatologicosPersonales>(_store);
    _antecedentesGinecologicosBox = Box<AntecedentesGinecologicos>(_store);
    _antecedentesObstetricosBox = Box<AntecedentesObstetricos>(_store);
    _interrogatorioBox = Box<Interrogatorio>(_store);
    _signosVitalesBox = Box<SignosVitalesModel>(_store);
    _examenFisicoBox = Box<ExamenFisicoModel>(_store);
    _interconsultasBox = Box<InterconsultasModel>(_store);
    _geneticaBox = Box<GeneticaModel>(_store);
    _laboratorioBox = Box<LaboratorioMicrobiologiaModel>(_store);
   _embarazoBox = Box<Embarazo>(_store);
   _recienNacidoBox = Box<RecienNacido>(_store);

    // Add some demo data if the box is empty.
    if (_pacienteBox.isEmpty()) {
      // _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Note: setting a unique directory is recommended if running on desktop
    // platforms. If none is specified, the default directory is created in the
    // users documents directory, which will not be unique between apps.
    // On mobile this is typically fine, as each app has its own directory
    // structure.

    // Note: set macosApplicationGroup for sandboxed macOS applications, see the
    // info boxes at https://docs.objectbox.io/getting-started for details.

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
      directory: p.join(
          (await getApplicationDocumentsDirectory()).path,
          "obx-demo"
      ),
      macosApplicationGroup: "objectbox.demo",
    );
    return ObjectBox._create(store);
  }

  /// Método para obtener todos los pacientes
  List<Paciente> getAllPacientes() {
    return _pacienteBox.getAll();
  }

  /// Método para agregar un nuevo paciente
  void addPaciente(Paciente paciente) {
    _pacienteBox.put(paciente);
  }

   void addEmbarazoActual(EmbarazoActual embarazoActual) {
    _embarazoActual.put(embarazoActual);
  }

  void addAntecedentesPatologicosPersonales(AntecedentesPatologicosPersonales antecedente) {
    _antecedentesPatologicosBox.put(antecedente);
  }

  void addAntecedentesGinecologicos(AntecedentesGinecologicos antecedente) {
    _antecedentesGinecologicosBox.put(antecedente);
  }

  void addAntecedentesObstetricos(AntecedentesObstetricos antecedente) {
    _antecedentesObstetricosBox.put(antecedente);
  }

  void addInterrogatorio(Interrogatorio interrogatorio) {
    _interrogatorioBox.put(interrogatorio);
  }

  void addSignosVitalesModel(SignosVitalesModel signosVitales) {
    _signosVitalesBox.put(signosVitales);
  }

  void addExamenFisico(ExamenFisicoModel examenFisico) {
    _examenFisicoBox.put(examenFisico);
  }

  void addInterconsultasModel(InterconsultasModel interconsulta) {
    _interconsultasBox.put(interconsulta);
  }

  void addGeneticaModel(GeneticaModel genetica) {
    _geneticaBox.put(genetica);
  }

  void addLaboratorioMicrobiologiaModel(LaboratorioMicrobiologiaModel laboratorio) {
    _laboratorioBox.put(laboratorio);
  }

  void addEmbarazos(List<Embarazo> embarazos) {
    _embarazoBox.putMany(embarazos);
  }

  void addRecienNacido(RecienNacido recienNacido) {
    _recienNacidoBox.put(recienNacido);
  }


  /// Método para borrar un paciente por ID
  void deletePaciente(int id) {
    _pacienteBox.remove(id);
  }

  /// Método para obtener pacientes por noIdentidad
  List<Paciente>? getPacientesByNoIdentidad(String? noIdentidad) {
    safePrint("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    safePrint(noIdentidad);
    if(noIdentidad != null){
      final query = _pacienteBox.query(Paciente_.noIdentidad.startsWith(noIdentidad));
      return query.build().find();
    }
    return [];
  }

  /// Método para obtener el total de pacientes
  int countPacientes() {
    return _pacienteBox.count();
  }

  /// Método para obtener los últimos 5 pacientes registrados
  List<Paciente> getLastFivePacientes() {
    final query = (_pacienteBox.query()
        .order(Paciente_.id, flags: Order.descending)
        .build())..limit = 5;
    final pacientes = query
        .find();
    query.close(); // Cierra la consulta para liberar recursos
    return pacientes;
  }

  /// Método para cerrar el store cuando ya no se necesite
  void dispose() {
    _store.close();
  }

  // Método privado para agregar datos de demostración (opcional)
  void _putDemoData() {
  /*  final demoPacientes = [
      Paciente(
        noIdentidad: '1234567890123',
        nombre: 'María Pérez',
        fechaNacimiento: DateTime(1990, 5, 20),
        fechaRegistro: DateTime.now().subtract(Duration(days: 1)),
      ),
      // Añade más pacientes de demostración si lo deseas
    ];
    _pacienteBox.putMany(demoPacientes);*/
  }

  /// Método para obtener un paciente por ID
  Paciente? getPacienteById(int id) {
    return _pacienteBox.get(id); // Devuelve el paciente por su ID, o null si no se encuentra
  }
}

