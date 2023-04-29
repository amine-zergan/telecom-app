import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController {
  /// declare variable of pageController
  /// update methodes with getter;
  late PageController _controller; // initail in intState
  PageController get pageController => _controller;
  int _page = 0;
  int get currentPage => _page;

  /// Func of Type [void] for updating current Page
  ///
  void updateCurrentPage(int index) {
    _page = index;
    update();
  }

  /// Func of Type [void] for navigate to next Page with methode animateToPage
  ///
  /// with params duration [500s] and curve [linear]
  ///
  /// and update value of progress Bar
  void navigatePageController() {
    if (_page <= 4) {
      _controller.animateToPage(
        _page + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      value = value + 0.16;
    } else if (_page == 5 && formProfile.currentState!.validate()) {
      //value = 1 - 0.16;
      // ignore: avoid_print
      print("activate form Profile");
      _controller.animateToPage(
        _page + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );

      /// check validat form in _page =5
    } else if (_page == 6) {
      // ignore: avoid_print
      print("activate form Profile");
      value = 1.0;

      /// check validat form in _page =5
      // navigation vers page home
    }
    update();
  }

  bool getLastPage() {
    return _page == 6;
  }

  /// progress bar value depend on fields page ...
  double value = 0.0;

  ///  Configuration for Page [NiveauPage]
  /// Variable and Logique for NiveauPage params [selectedIndex] int?
  ///
  /// update variable [String] wil insert in Profile database
  int? selectNiveau;
  String? niveau;

  void updateNiveau(int index, String value) {
    selectNiveau = index;
    niveau = value;
    // ignore: avoid_print
    print(niveau);
    update();
  }

  /// Configuration for [PostPage]
  /// For this page we need to variable like NiveauPage
  /// variable [poste] of Type String?
  /// variable [selectePoste] of Type int?
  ///
  /// and we need to update them
  int? selectPoste;
  String? poste;

  void updatePoste(int index, String value) {
    selectPoste = index;
    poste = value;
    // ignore: avoid_print
    print(poste);
    update();
  }

  /// Configuration for [ContractPage]
  /// For this page we need to variable like NiveauPage
  /// variable [contrat] of Type String?
  /// variable [selectContrat] of Type int?
  ///
  /// and we need to update them
  int? selectContrat;
  String? contrat;

  void updateContrat(int index, String value) {
    selectContrat = index;
    contrat = value;
    // ignore: avoid_print
    print(contrat);
    update();
  }

  /// Configuration for [SalairePAge]
  /// For this page we need to variable like NiveauPage
  /// variable [salaire] of Type String?
  /// variable [selectSalaire] of Type int?
  ///
  /// and we need to update them
  int? selectSalaire;
  String? salaire;

  void updateSalaire(int index, String value, bool selected) {
    selectSalaire = selected ? index : null;
    salaire = value;
    // ignore: avoid_print
    print(salaire);
    update();
  }

  /// Configuration for [TaillePage]
  /// For this page we need to variable like NiveauPage
  /// variable [taille] of Type String?
  /// variable [selectTaille] of Type int?
  ///
  /// and we need to update them
  int? selectTaille;
  String? taille;

  void updateTailleEntreprise(int index, String value) {
    selectTaille = index;
    taille = value;
    // ignore: avoid_print
    print(taille);
    update();
  }

  /// part of : [EntreprisePage] variable
  /// Form need a GlobalKey<FormState> for validation of TextInputFormField
  ///
  /// also need FocusNode and TextEditcontroller [FocusNode] [TextEditController]
  late TextEditingController nameControllerProfile;
  late TextEditingController addressControllerProfile;
  late TextEditingController codePostaleControllerProfile;
  late TextEditingController phoneControllerProfile;

  /// GlobalKey for Form Profile [formProfile] and Form Entreprise [formEntreprise]
  final GlobalKey<FormState> formProfile = GlobalKey<FormState>();

  late FocusNode name;
  late FocusNode address;
  late FocusNode codePostale;
  late FocusNode numero;

  @override
  void onInit() {
    _controller = PageController();
    nameControllerProfile = TextEditingController();
    addressControllerProfile = TextEditingController();
    codePostaleControllerProfile = TextEditingController();
    phoneControllerProfile = TextEditingController();

    name = FocusNode();
    address = FocusNode();
    codePostale = FocusNode();
    numero = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    nameControllerProfile.dispose();
    addressControllerProfile.dispose();
    codePostaleControllerProfile.dispose();
    phoneControllerProfile.dispose();
    name.dispose();
    address.dispose();
    codePostale.dispose();
    numero.dispose();
    super.onClose();
  }
}
