// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/radio_order_model.dart';

class ContactController extends GetxController with StateMixin {
  final IrepositoryContactDatasource repos;
  ContactController(this.repos);

  List<Contact> contacts = [];
  StreamController<Contact?> streamController =
      StreamController<Contact?>.broadcast();

  late StreamSubscription streamSubscription;

  bool loading = false;

  void fetchAllContact() async {
    try {
      loading = true;
      Future.delayed(const Duration(seconds: 3), () async {
        print("============ loading part contact =======");
        final listContact = await repos.fetchAll();
        listContact.map((e) => contacts.add(e)).toList();
        print("========= contact controller $contacts ");
        loading = true;
        update();
      });
    } catch (e) {
      contacts = [];
      print("========= contact controller error $e ");
      loading = true;
      update();
    }
  }

  /// =========== filter-page parametre  ===============///
  /// **************** variable *****************///
  double slider = 5.0;
  List<String> filters = [];
  List<String> posts = occupations;

  OrderContact? order = OrderContact.nom;

  /// Function for updating slider
  void onChangedSlider(double value) {
    slider = value;
    print("======== update slider $slider =========");
    update();
  }

  /// Function for updating chip value
  void onSelectedChip(bool value, String post) {
    if (value) {
      filters.add(post);
    } else {
      filters.remove(post);
    }
    print("======== update filterlist $filters =========");
    update();
  }

  /// Function for Ordering List<Contact>

  void onChangedOrder(OrderContact? value) {
    order = value;
    print("======== update order $order =========");
    update();
  }

  @override
  void onInit() {
    streamSubscription = streamController.stream.listen(
        (event) {
          print(
            "================= event on streamcontact: $event ================",
          );
          contacts.add(event!);
          print(
            "=========== contacts length are ${contacts.length} ==========",
          );
          update();
        },
        onDone: () => print(
              "======= subscription of stream contacts is Done =============",
            ),
        onError: (error) {
          print("========== error stream founded =======");
        });
    fetchAllContact();
    super.onInit();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
    super.onClose();
  }
}
