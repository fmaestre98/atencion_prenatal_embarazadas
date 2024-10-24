// add_paciente_navigator.dart

import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/add_paciente_intermediate_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/datos_personales_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/examen_fisico_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/genetica_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/interconsultas_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/interrogatorios_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/laboratorio_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/resumen_atencion_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/addPacientePages/signos_vitales_page.dart';
import 'package:flutter/material.dart';

class AddPacienteNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => AddPacienteIntermediatePage();
            break;
          case '/datosPersonales':
            builder = (BuildContext _) => DatosPersonalesPage();
            break;
          case '/interrogatorio':
            builder = (BuildContext _) => InterrogatorioPage();
            break;
          case '/signosVitales':
            builder = (BuildContext _) => SignosVitalesPage();
            break;
          case '/examenFisico':
            builder = (BuildContext _) => ExamenFisicoPage();
            break;
          case '/laboratorio':
            builder = (BuildContext _) => LaboratorioPage();
            break;
          case '/genetica':
            builder = (BuildContext _) => GeneticaPage();
            break;
          case '/interconsultas':
            builder = (BuildContext _) => InterconsultasPage();
            break;
          case '/resumenAtencion':
            builder = (BuildContext _) => ResumenAtencionPage();
            break;
          default:
            throw Exception('Ruta no encontrada: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}