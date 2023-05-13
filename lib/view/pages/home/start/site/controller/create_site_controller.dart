// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:telecom/data/post_data.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/site/site_model.dart';

class CreateSiteController extends GetxController {
  final IrepositoryOperatorDatasource repositoryOperator;
  final IrepositorySiteDatasource repositorySite;
  CreateSiteController({
    required this.repositoryOperator,
    required this.repositorySite,
  });

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? regiondata;
  List<Operator> operators = [];
  // ignore: unused_field
  Operator? _operator;
  String error = "";
  int? selectedRegion;
  int? selectedOperator;
  String currentRegion = "";

  bool activeCheckBox = false;

  void updateCheckBox(bool? value) {
    activeCheckBox = value!;
    if (activeCheckBox == true) {
      updatePositionfromGps();
    }
    fieldLatitude.clear();
    fieldLongitude.clear();
    update();
  }

  void updateSelectedRegion(int index) {
    selectedRegion = index;
    regiondata = region[index];
    update();
  }

  void updateSelectedOperator(int index) {
    _operator = operators[index];
    selectedOperator = index;
    update();
  }

  /// Function return List of [Operator] from database
  void getAllOpearator() async {
    try {
      final response = await repositoryOperator.queryOperators();
      response.map((operator) {
        operators.add(operator);
      }).toList();
      // ignore: avoid_print
      print("========= operator fetched with succes ${operators.length}");
      update();
    } catch (e) {
      operators = [];
    }
    update();
  }

  /// Function get Coordonnée from current position :
  /// first active permission
  /// get [Position] from gps
  void updatePositionfromGps() async {
    try {
      final position = await _determinePosition();
      if (position != null) {
        fieldLatitude.text = position.latitude.toString();
        fieldLongitude.text = position.longitude.toString();
      }
      update();
    } catch (e) {
      error = " merci d'activer positon gps de votre telephone ";
      update();
    }
  }

  Future<Position?> _determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        error = "Location services est  desactiver.";
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          error = "Location permissions n'est pas autoriser.";
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        error = "Location permissions n'est pas autoriser pour toujours.";
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      update();
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      error = "position n'est pas pris, merci de verfie";
      update();
      return null;
    }
  }

  /// Function for insert [Site] to Table [sites]
  void insertSiteToDb() async {
    try {
      if (formKey.currentState!.validate() == true) {
        if (await isExistSite()) {
          //error = "Site existe deja";
          Get.snackbar(
            "Notification",
            "Site existe deja...",
            backgroundColor: Colors.red.shade200,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          final Site model = Site(
            name: fieldNom.text,
            region: currentRegion,
            operator: _operator!,
            longitude: fieldLongitude.text,
            latitude: fieldLatitude.text,
            responsable: fieldMaintenancier.text,
            phone: fieldContact.text,
            description: fieldDescription.text,
          );
          // ignore: avoid_print
          print(model);
          final result = await repositorySite.insert(model);
          // ignore: avoid_print
          print("============== result $result ============");
          Get.snackbar(
            "Notification",
            "Site crée avec succes",
            backgroundColor: Colors.green.shade200,
            snackPosition: SnackPosition.TOP,
          );
          clearController();
        }
      }
    } catch (e) {
      error = "Site n'est pas enregistrer :(";
      // ignore: avoid_print
      print(e.toString());
    }
    update();
  }

  /// Function for insert [Site] to Table [sites]
  Future<bool> isExistSite() async {
    final bool response =
        await repositorySite.isExist(fieldNom.text, _operator!.id!);
    return response;
  }

  void selectRegioniWithNomField() {
    if (fieldNom.text.isNotEmpty) {
      String search = fieldNom.text.substring(0, 3);
      selectedRegion = region.indexWhere(
        (element) => element.startsWith(search),
      );
      if (selectedRegion != null) {
        currentRegion = region[selectedRegion!];
      } else {
        currentRegion = "";
      }
    }
    update();
  }

  void clearController() {
    fieldContact.clear();
    fieldDescription.clear();
    fieldLatitude.clear();
    fieldLongitude.clear();
    fieldMaintenancier.clear();
    fieldMaintenancier.clear();
    fieldNom.clear();
    error = "";
    selectedOperator = null;
    selectedRegion = null;
    update();
  }

  late TextEditingController fieldNom;
  late TextEditingController fieldLongitude;
  late TextEditingController fieldLatitude;
  late TextEditingController fieldMaintenancier;
  late TextEditingController fieldContact;
  late TextEditingController fieldDescription;

  late FocusNode nom;
  late FocusNode maintenancier;
  late FocusNode contact;
  late FocusNode description;
  late FocusNode longitude;
  late FocusNode latitude;

  @override
  void onInit() {
    getAllOpearator();
    fieldNom = TextEditingController();
    fieldContact = TextEditingController();
    fieldDescription = TextEditingController();
    fieldLatitude = TextEditingController();
    fieldLongitude = TextEditingController();
    fieldMaintenancier = TextEditingController();

    nom = FocusNode();
    maintenancier = FocusNode();
    contact = FocusNode();
    description = FocusNode();
    longitude = FocusNode();
    latitude = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    fieldNom.dispose();
    fieldContact.dispose();
    fieldLatitude.dispose();
    fieldLongitude.dispose();
    fieldMaintenancier.dispose();
    longitude.dispose();
    latitude.dispose();
    super.onClose();
  }
}
