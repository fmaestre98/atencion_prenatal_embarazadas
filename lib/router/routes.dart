class Routes {
  Routes._();

  // Rutas principales
  static const String homePage = '/home';
  static const String addPage = '/add';
  static const String searchPage = '/search';

  // Subrutas de AddPage
  static const String addDatosPersonales = 'datosPersonales';
  static const String addInterrogatorio = 'interrogatorio';
  static const String addSignosVitales = 'signosVitales';
  static const String addExamenFisico = 'examenFisico';
  static const String addLaboratorio = 'laboratorio';
  static const String addGenetica = 'genetica';
  static const String addInterconsultas = 'interconsultas';
  static const String addResumenAtencion = 'resumenAtencion';

  // Rutas anidadas de AddPage
  static const String routeAddDatosPersonales = '$addPage/datosPersonales';
  static const String routeAddInterrogatorio = '$addPage/interrogatorio';
  static const String routeAddSignosVitales = '$addPage/signosVitales';
  static const String routeAddExamenFisico = '$addPage/examenFisico';
  static const String routeAddLaboratorio = '$addPage/laboratorio';
  static const String routeAddGenetica = '$addPage/genetica';
  static const String routeAddInterconsultas = '$addPage/interconsultas';
  static const String routeAddResumenAtencion = '$addPage/resumenAtencion';
}