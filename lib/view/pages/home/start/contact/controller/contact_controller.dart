import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';

/// class Controller :responsable for saving [contact] To database
/// contient all variable needed in View [StartContact]
///
class CreateContactController extends GetxController {
  final IrepositoryContactDatasource repository;

  CreateContactController(this.repository);

  /// Create essential variable for saving data contact
  late TextEditingController nomContact;
  late FocusNode focusNom;
  late TextEditingController contact;
  late FocusNode focusContact;
  final GlobalKey<FormState> formKey =
      GlobalKey(); // gerer les errors dans les champs de saisi

  /// For saving Post to contact for filtering and search in Database
  /// create variable [post] of type [String?] for groupvalue in RadioListeTile
  /// for List<String> we will import [occupations] from folder lib/data

  int? selectValue;
  List<String> posts = occupations;
  String post = "";
  String error = "";

  /// updating value [poste]
  void onChanged(String? value, int index) {
    post = value ?? "";
    selectValue = index;

    error = "";
    update(); // replace-setstate
    // ignore: avoid_print
    print("============== $post =========");
  }

  /// Function [void] for Reset variables [nomContact] [contact] [post] [error]
  ///
  void clearVariable() {
    nomContact.clear();
    post = "";
    selectValue = null;
    contact.clear();
  }

  /// Function for insert model [Contact] in Database
  /// verife in db in contact exist with [contact] if true [form] with return validate_error
  /// if valaide will be [false] then model can injected to Db
  ///
  Future<bool> isExist(String contact) async {
    return await repository.verifieExistance(contact);
  }

  /// Function of Type [void] for saving data model of type [Contact] to table [contacts]
  ///

  Future<void> verifieAndValidate() async {
    try {
      if ((formKey.currentState!.validate() == true) && (selectValue != null)) {
        if ((await isExist(contact.text)) == false) {
          error = "";
          final model = Contact(
            name: nomContact.text,
            post: post,
            contact: contact.text,
          );
          final result = await repository.insert(model);
          Get.snackbar(
            "Notification",
            "Contact crée avec succes",
            backgroundColor: Colors.green.shade300,
            snackPosition: SnackPosition.TOP,
          );

          // ignore: avoid_print
          print(result);
          clearVariable();
          update();
        } else {
          error = "numero exist deja";
        }
      } else if ((formKey.currentState!.validate() == false) &&
          (selectValue == null)) {
        // ignore: avoid_print
        error = "contact doit choisir le post";
      } else if (selectValue == null) {
        // ignore: avoid_print
        error = "ontact doit choisir le post";
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // ignore: avoid_print
      error = "contact n'est enregistrer";
    }
    update();
  }

  /// initstate
  @override
  void onInit() {
    nomContact = TextEditingController();
    contact = TextEditingController();
    focusNom = FocusNode();
    focusContact = FocusNode();
    super.onInit();
  }

  /// on close to dispose controller and focusNode
  @override
  void onClose() {
    nomContact.dispose();
    contact.dispose();
    focusNom.dispose();
    focusContact.dispose();
    super.onClose();
  }
}
