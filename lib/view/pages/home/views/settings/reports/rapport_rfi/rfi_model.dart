// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/survey_site_controller.dart';

class RFIModel {
  final String site;
  final String supervior;
  final String operator;
  final String details;
  final Site type;
  final double pylone;
  final String support;
  final bool? bracon;
  final bool? barrette;
  final bool? tremie;
  final bool? cheminV;
  final bool? cheminH;
  final List<File> imageOutdoor;
  final List<File> imageIndoor;
  final bool? bts;
  final bool? cheminCable;
  final bool? rackEspace;
  final bool? courantAc;
  final bool? courantDc;
  final bool? gND;
  final bool? clim;
  RFIModel({
    required this.site,
    required this.supervior,
    required this.operator,
    required this.type,
    required this.pylone,
    required this.support,
    required this.details,
    this.bracon,
    this.barrette,
    this.tremie,
    this.cheminV,
    this.cheminH,
    required this.imageOutdoor,
    required this.imageIndoor,
    this.bts,
    this.cheminCable,
    this.rackEspace,
    this.courantAc,
    this.courantDc,
    this.gND,
    this.clim,
  });
}
