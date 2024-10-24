import 'package:atencion_prenatal_embarazadas/models/personal_data_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Interrogatorio {
  int id; // field auto-incremented
  final paciente = ToOne<Paciente>(); // Relación uno a uno con Paciente

  //Sistema respiratorio
  bool? srDisnea;
  bool? srDolor;
  bool? srHermoptisis;
  bool? srExpectoracion;
  bool? srTos;
  bool? srOtros;
  String? srObservaciones;

  //Sistema cardiovascular
  bool? scDisnea;
  bool? scDolor;
  bool? scClaudicacionIntermitente;
  bool? scCianosis;
  bool? scTos;
  bool? scPalpitaciones;
  bool? scOtros;
  String? scObservaciones;

  //Sistema digestivo
  bool? sdDisfagia;
  bool? sdDolor;
  bool? sdColicos;
  bool? sdHermatemesis;
  bool? sdAcolia;
  bool? sdPirosis;
  bool? sdNauseas;
  bool? sdEnterorragia;
  bool? sdConstipacion;
  bool? sdAcidez;
  bool? sdDiarreas;
  bool? sdAerogastrias;
  bool? sdVomitos;
  bool? sdMelena;
  bool? sdOtros;
  String? sdObservaciones;

  //Sistema urogenital
  bool? suNicturioas;
  bool? suDolor;
  bool? suOrinasTurbias;
  bool? suExudadoUretral;
  bool? suDisuria;
  bool? suRetencionUrinaria;
  bool? suHermaturia;
  bool? suIncontinencia;
  bool? suPolaquiuria;
  bool? suUretorragia;
  bool? suImpotiencia;
  bool? suTumoracion;
  bool? suCalculos;
  bool? suOtros;
  String? suObservaciones;

  //Sistema neurologico
  bool? snCefaleas;
  bool? snDolorFacial;
  bool? snVomitos;
  bool? snDolorCervical;
  bool? snVertigos;
  bool? snDolorLumbar;
  bool? snConvulsiones;
  bool? snAlteracionMarcha;
  bool? snDefictMotor;
  bool? snAlteracionEquilibrio;
  bool? snDeficitSensitivo;
  bool? snAlteracionVisual;
  bool? snAlteracionConciencia;
  bool? snDificultadHablarEntender;
  bool? snOtros;
  String? snObservaciones;

  //Sistema endocrino
  bool? seHipofisis;
  bool? seOvarios;
  bool? sePancreas;
  bool? seSuprarrenal;
  bool? seParatiroideas;
  bool? seTiroides;
  bool? seTesticulos;
  bool? seOtros;
  String? seObservaciones;

  //Otros Datos
  bool? astenia;
  bool? anorexia;
  bool? epistaxis;
  bool? fiebre;
  bool? artralgia;
  bool? polifagia;
  bool? edema;
  bool? prurito;
  bool? perdidaPeso;
  bool? gananciaPeso;
  bool? acroparentesias;
  bool? otros;
  String? observaciones;

  Interrogatorio(
      {this.id = 0,
      this.srDisnea,
      this.srDolor,
      this.srHermoptisis,
      this.srExpectoracion,
      this.srTos,
      this.srOtros,
      this.srObservaciones,
      this.scDisnea,
      this.scDolor,
      this.scClaudicacionIntermitente,
      this.scCianosis,
      this.scTos,
      this.scPalpitaciones,
      this.scOtros,
      this.scObservaciones,
      this.sdDisfagia,
      this.sdDolor,
      this.sdColicos,
      this.sdHermatemesis,
      this.sdAcolia,
      this.sdPirosis,
      this.sdNauseas,
      this.sdEnterorragia,
      this.sdConstipacion,
      this.sdAcidez,
      this.sdDiarreas,
      this.sdAerogastrias,
      this.sdVomitos,
      this.sdMelena,
      this.sdOtros,
      this.sdObservaciones,
      this.suNicturioas,
      this.suDolor,
      this.suOrinasTurbias,
      this.suExudadoUretral,
      this.suDisuria,
      this.suRetencionUrinaria,
      this.suHermaturia,
      this.suIncontinencia,
      this.suPolaquiuria,
      this.suUretorragia,
      this.suImpotiencia,
      this.suTumoracion,
      this.suCalculos,
      this.suOtros,
      this.suObservaciones,
      this.snCefaleas,
      this.snDolorFacial,
      this.snVomitos,
      this.snDolorCervical,
      this.snVertigos,
      this.snDolorLumbar,
      this.snConvulsiones,
      this.snAlteracionMarcha,
      this.snDefictMotor,
      this.snAlteracionEquilibrio,
      this.snDeficitSensitivo,
      this.snAlteracionVisual,
      this.snAlteracionConciencia,
      this.snDificultadHablarEntender,
      this.snOtros,
      this.snObservaciones,
      this.seHipofisis,
      this.seOvarios,
      this.sePancreas,
      this.seSuprarrenal,
      this.seParatiroideas,
      this.seTiroides,
      this.seTesticulos,
      this.seOtros,
      this.seObservaciones,
      this.astenia,
      this.anorexia,
      this.epistaxis,
      this.fiebre,
      this.artralgia,
      this.polifagia,
      this.edema,
      this.prurito,
      this.perdidaPeso,
      this.gananciaPeso,
      this.acroparentesias,
      this.otros,
      this.observaciones});

  Interrogatorio copyWith({
    int? id,
    bool? srDisnea,
    bool? srDolor,
    bool? srHermoptisis,
    bool? srExpectoracion,
    bool? srTos,
    bool? srOtros,
    String? srObservaciones,
    bool? scDisnea,
    bool? scDolor,
    bool? scClaudicacionIntermitente,
    bool? scCianosis,
    bool? scTos,
    bool? scPalpitaciones,
    bool? scOtros,
    String? scObservaciones,
    bool? sdDisfagia,
    bool? sdDolor,
    bool? sdColicos,
    bool? sdHermatemesis,
    bool? sdAcolia,
    bool? sdPirosis,
    bool? sdNauseas,
    bool? sdEnterorragia,
    bool? sdConstipacion,
    bool? sdAcidez,
    bool? sdDiarreas,
    bool? sdAerogastrias,
    bool? sdVomitos,
    bool? sdMelena,
    bool? sdOtros,
    String? sdObservaciones,
    bool? suNicturioas,
    bool? suDolor,
    bool? suOrinasTurbias,
    bool? suExudadoUretral,
    bool? suDisuria,
    bool? suRetencionUrinaria,
    bool? suHermaturia,
    bool? suIncontinencia,
    bool? suImpotiencia,
    bool? suPolaquiuria,
    bool? suUretorragia,
    bool? suTumoracion,
    bool? suCalculos,
    bool? suOtros,
    String? suObservaciones,
    bool? snCefaleas,
    bool? snDolorFacial,
    bool? snVomitos,
    bool? snDolorCervical,
    bool? snVertigos,
    bool? snDolorLumbar,
    bool? snConvulsiones,
    bool? snAlteracionMarcha,
    bool? snDefictMotor,
    bool? snAlteracionEquilibrio,
    bool? snDeficitSensitivo,
    bool? snAlteracionVisual,
    bool? snAlteracionConciencia,
    bool? snDificultadHablarEntender,
    bool? snOtros,
    String? snObservaciones,
    bool? seHipofisis,
    bool? seOvarios,
    bool? sePancreas,
    bool? seSuprarrenal,
    bool? seParatiroideas,
    bool? seTiroides,
    bool? seTesticulos,
    bool? seOtros,
    String? seObservaciones,
    bool? astenia,
    bool? anorexia,
    bool? epistaxis,
    bool? fiebre,
    bool? artralgia,
    bool? polifagia,
    bool? edema,
    bool? prurito,
    bool? perdidaPeso,
    bool? gananciaPeso,
    bool? acroparentesias,
    bool? otros,
    String? observaciones,
  }) {
    return Interrogatorio(
        srDisnea: srDisnea ?? this.srDisnea,
        srDolor: srDolor ?? this.srDolor,
        srHermoptisis: srHermoptisis ?? this.srHermoptisis,
        srExpectoracion: srExpectoracion ?? this.srExpectoracion,
        srTos: srTos ?? this.srTos,
        srOtros: srOtros ?? this.srOtros,
        srObservaciones: srObservaciones ?? this.srObservaciones,
        scDisnea: scDisnea ?? this.scDisnea,
        scDolor: scDolor ?? this.scDolor,
        scClaudicacionIntermitente:
            scClaudicacionIntermitente ?? this.scClaudicacionIntermitente,
        scCianosis: scCianosis ?? this.scCianosis,
        scTos: scTos ?? this.scTos,
        scPalpitaciones: scPalpitaciones ?? this.scPalpitaciones,
        scOtros: scOtros ?? this.scOtros,
        scObservaciones: scObservaciones ?? this.scObservaciones,
        sdDisfagia: sdDisfagia ?? this.sdDisfagia,
        sdDolor: sdDolor ?? this.sdDolor,
        sdColicos: sdColicos ?? this.sdColicos,
        sdHermatemesis: sdHermatemesis ?? this.sdHermatemesis,
        sdAcolia: sdAcolia ?? this.sdAcolia,
        sdPirosis: sdPirosis ?? this.sdPirosis,
        sdNauseas: sdNauseas ?? this.sdNauseas,
        sdEnterorragia: sdEnterorragia ?? this.sdEnterorragia,
        sdConstipacion: sdConstipacion ?? this.sdConstipacion,
        sdAcidez: sdAcidez ?? this.sdAcidez,
        sdDiarreas: sdDiarreas ?? this.sdDiarreas,
        sdAerogastrias: sdAerogastrias ?? this.sdAerogastrias,
        sdVomitos: sdVomitos ?? this.sdVomitos,
        sdMelena: sdMelena ?? this.sdMelena,
        sdOtros: sdOtros ?? this.sdOtros,
        sdObservaciones: sdObservaciones ?? this.sdObservaciones,
        suNicturioas: suNicturioas ?? this.suNicturioas,
        suDolor: suDolor ?? this.suDolor,
        suOrinasTurbias: suOrinasTurbias ?? this.suOrinasTurbias,
        suExudadoUretral: suExudadoUretral ?? this.suExudadoUretral,
        suDisuria: suDisuria ?? this.suDisuria,
        suRetencionUrinaria: suRetencionUrinaria ?? this.suRetencionUrinaria,
        suHermaturia: suHermaturia ?? this.suHermaturia,
        suIncontinencia: suIncontinencia ?? this.suIncontinencia,
        suPolaquiuria: suPolaquiuria ?? this.suPolaquiuria,
        suUretorragia: suUretorragia ?? this.suUretorragia,
        suImpotiencia: suImpotiencia ?? this.suImpotiencia,
        suTumoracion: suTumoracion ?? this.suTumoracion,
        suCalculos: suCalculos ?? this.suCalculos,
        suOtros: suOtros ?? this.suOtros,
        suObservaciones: suObservaciones ?? this.suObservaciones,
        snCefaleas: snCefaleas ?? this.snCefaleas,
        snDolorFacial: snDolorFacial ?? this.snDolorFacial,
        snVomitos: snVomitos ?? this.snVomitos,
        snDolorCervical: snDolorCervical ?? this.snDolorCervical,
        snVertigos: snVertigos ?? this.snVertigos,
        snDolorLumbar: snDolorLumbar ?? this.snDolorLumbar,
        snConvulsiones: snConvulsiones ?? this.snConvulsiones,
        snAlteracionMarcha: snAlteracionMarcha ?? this.snAlteracionMarcha,
        snDefictMotor: snDefictMotor ?? this.snDefictMotor,
        snAlteracionEquilibrio:
            snAlteracionEquilibrio ?? this.snAlteracionEquilibrio,
        snDeficitSensitivo: snDeficitSensitivo ?? this.snDeficitSensitivo,
        snAlteracionVisual: snAlteracionVisual ?? this.snAlteracionVisual,
        snAlteracionConciencia:
            snAlteracionConciencia ?? this.snAlteracionConciencia,
        snDificultadHablarEntender:
            snDificultadHablarEntender ?? this.snDificultadHablarEntender,
        snOtros: snOtros ?? this.snOtros,
        snObservaciones: snObservaciones ?? this.snObservaciones,
        seHipofisis: seHipofisis ?? this.seHipofisis,
        seOvarios: seOvarios ?? this.seOvarios,
        sePancreas: sePancreas ?? this.sePancreas,
        seSuprarrenal: seSuprarrenal ?? this.seSuprarrenal,
        seParatiroideas: seParatiroideas ?? this.seParatiroideas,
        seTiroides: seTiroides ?? this.seTiroides,
        seTesticulos: seTesticulos ?? this.seTesticulos,
        seOtros: seOtros ?? this.seOtros,
        seObservaciones: seObservaciones ?? this.seObservaciones,
        astenia: astenia ?? this.astenia,
        anorexia: anorexia ?? this.anorexia,
        epistaxis: epistaxis ?? this.epistaxis,
        fiebre: fiebre ?? this.fiebre,
        artralgia: artralgia ?? this.artralgia,
        polifagia: polifagia ?? this.polifagia,
        edema: edema ?? this.edema,
        prurito: prurito ?? this.prurito,
        perdidaPeso: perdidaPeso ?? this.perdidaPeso,
        gananciaPeso: gananciaPeso ?? this.gananciaPeso,
        acroparentesias: acroparentesias ?? this.acroparentesias,
        otros: otros ?? this.otros,
        observaciones: observaciones ?? this.observaciones,
        id: id ?? this.id);
  }

  @override
  String toString() {
    return 'Interrogatorio{id: $id, paciente: $paciente, srDisnea: $srDisnea, srDolor: $srDolor, srHermoptisis: $srHermoptisis, srExpectoracion: $srExpectoracion, srTos: $srTos, srOtros: $srOtros, srObservaciones: $srObservaciones, scDisnea: $scDisnea, scDolor: $scDolor, scClaudicacionIntermitente: $scClaudicacionIntermitente, scCianosis: $scCianosis, scTos: $scTos, scPalpitaciones: $scPalpitaciones, scOtros: $scOtros, scObservaciones: $scObservaciones, sdDisfagia: $sdDisfagia, sdDolor: $sdDolor, sdColicos: $sdColicos, sdHermatemesis: $sdHermatemesis, sdAcolia: $sdAcolia, sdPirosis: $sdPirosis, sdNauseas: $sdNauseas, sdEnterorragia: $sdEnterorragia, sdConstipacion: $sdConstipacion, sdAcidez: $sdAcidez, sdDiarreas: $sdDiarreas, sdAerogastrias: $sdAerogastrias, sdVomitos: $sdVomitos, sdMelena: $sdMelena, sdOtros: $sdOtros, sdObservaciones: $sdObservaciones, suNicturioas: $suNicturioas, suDolor: $suDolor, suOrinasTurbias: $suOrinasTurbias, suExudadoUretral: $suExudadoUretral, suDisuria: $suDisuria, suRetencionUrinaria: $suRetencionUrinaria, suHermaturia: $suHermaturia, suIncontinencia: $suIncontinencia, suPolaquiuria: $suPolaquiuria, suUretorragia: $suUretorragia, suImpotiencia: $suImpotiencia, suTumoracion: $suTumoracion, suCalculos: $suCalculos, suOtros: $suOtros, suObservaciones: $suObservaciones, snCefaleas: $snCefaleas, snDolorFacial: $snDolorFacial, snVomitos: $snVomitos, snDolorCervical: $snDolorCervical, snVertigos: $snVertigos, snDolorLumbar: $snDolorLumbar, snConvulsiones: $snConvulsiones, snAlteracionMarcha: $snAlteracionMarcha, snDefictMotor: $snDefictMotor, snAlteracionEquilibrio: $snAlteracionEquilibrio, snDeficitSensitivo: $snDeficitSensitivo, snAlteracionVisual: $snAlteracionVisual, snAlteracionConciencia: $snAlteracionConciencia, snDificultadHablarEntender: $snDificultadHablarEntender, snOtros: $snOtros, snObservaciones: $snObservaciones, seHipofisis: $seHipofisis, seOvarios: $seOvarios, sePancreas: $sePancreas, seSuprarrenal: $seSuprarrenal, seParatiroideas: $seParatiroideas, seTiroides: $seTiroides, seTesticulos: $seTesticulos, seOtros: $seOtros, seObservaciones: $seObservaciones, astenia: $astenia, anorexia: $anorexia, epistaxis: $epistaxis, fiebre: $fiebre, artralgia: $artralgia, polifagia: $polifagia, edema: $edema, prurito: $prurito, perdidaPeso: $perdidaPeso, gananciaPeso: $gananciaPeso, acroparentesias: $acroparentesias, otros: $otros, observaciones: $observaciones}';
  }
}
