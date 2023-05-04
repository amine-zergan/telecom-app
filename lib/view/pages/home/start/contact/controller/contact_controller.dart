import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';

class ContactController extends GetxController {
  /// Create essential variable for saving data contact
  late TextEditingController nom;
  late FocusNode focusNom;
  late TextEditingController contact;
  late FocusNode focusContact;
  GlobalKey<FormState> formKey = GlobalKey();

  /// For saving Post to contact for filtering and search in Database
  /// create variable [post] of type [String?] for groupvalue in RadioListeTile
  /// for List<String> we will import [occupations] from folder lib/data

  int? selectValue;
  List<String> posts = occupations;
  String? post = "";

  /// updating value [poste]
  void onChanged(String? value, int index) {
    post = value;
    selectValue = index;
    update();
    // ignore: avoid_print
    print("============== $post =========");
  }

  /// Function for insert model [Contact] in Database
  /// verife in db in contact exist with [contact] if true [form] with return validate_error
  /// if valaide will be [false] then model can injected to Db

  void verifieAndValidate() {
    try {
      if (formKey.currentState!.validate() && selectValue != null) {
        // ignore: avoid_print
        print("data is valide u can insert contact");
      }
      // ignore: avoid_print
      print("contact must have  post");
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // ignore: avoid_print
      print("contact must have  post");
    }
  }

  /// initstate
  @override
  void onInit() {
    nom = TextEditingController();
    contact = TextEditingController();
    focusNom = FocusNode();
    focusContact = FocusNode();
    super.onInit();
  }

  /// on close to dispose controller and focusNode
  @override
  void onClose() {
    nom.dispose();
    contact.dispose();
    focusNom.dispose();
    focusContact.dispose();
    super.onClose();
  }
}
