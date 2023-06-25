// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';

class ContactController extends GetxController {
  final IrepositoryContactDatasource repos;

  List<Contact> contacts = [];

  ContactController(this.repos);

  void fetchAllContact() async {
    final listContact = await repos.fetchAll();
    listContact.map((e) => contacts.add(e)).toList();
    print("========= contact controller $contacts ");
    update();
  }

  @override
  void onInit() {
    fetchAllContact();
    super.onInit();
  }
}
