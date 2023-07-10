// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/services/cache/filter/filter_service.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';
import 'package:telecom/model/entreprise/profile_and_contact/filter_model.dart';
import 'package:telecom/utils/converter/enum/order_post.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController with StateMixin {
  final IrepositoryContactDatasource repos;
  final FilterServiceRepository filterRepository;
  ContactController(this.repos, this.filterRepository); //initialse

  List<Contact> contacts = [];
  StreamController<Contact?> streamController =
      StreamController<Contact?>.broadcast();

  late StreamSubscription streamSubscription;

  late StreamSubscription realTimeStream;

  bool loading = false;

  FilterContact? filter;

  initFilterfromDb() async {
    final silderfilter = await filterRepository.readLimitSearch();
    final postsFilter = await filterRepository.readPostsSearch();
    final contactOrder = await filterRepository.readOrderFilter();
    filter = FilterContact(
      slider: silderfilter,
      posts: postsFilter,
      contact: contactOrder?.value(),
    );
    update();
  }

  Future<List<Contact>> fetchContacts(FilterContact? filter) async {
    final listContact = await repos.fetchAll(filter);
    return listContact;
  }

  void fetchAllContact(FilterContact? filter) async {
    try {
      loading = true;
      print("============ loading part contact =======");
      final listContact = await repos.fetchAll(filter);
      listContact.map((e) => contacts.add(e)).toList();
      print("========= contact controller $contacts ");
      loading = false;

      update();
    } catch (e) {
      contacts = [];
      print("========= contact controller error $e ");
      loading = false;
      update();
    }
  }

  /// =========== filter-page parametre  ===============///
  /// **************** variable *****************///
  double slider = 2.0;
  List<String> filters = [];
  List<Contact> resultQuery = [];
  List<String> posts = occupations;
  double maxLength = 30.0;
  OrderContact? order = OrderContact.nom;

  /// Function for updating slider
  void onChangedSlider(double value) {
    slider = value;
    resultQuery.clear();
    filterRepository.saveLimit(slider);
    update();
  }

  /// Function for updating chip value
  void onSelectedChip(bool value, String post) {
    if (value) {
      filters.add(post);
    } else {
      filters.remove(post);
    }
    filterRepository.saveListPostSearch(filters);
    print("======== update filterlist $resultQuery =========");
    update();
  }

  /// Function for Ordering List<Contact>

  void onChangedOrder(OrderContact? value) {
    order = value;
    filterRepository.saveOrderFilter(order!);
    print("============ result query $resultQuery =====");
    update();
  }

  @override
  void onInit() {
    initFilterfromDb();
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
    fetchAllContact(filter);

    super.onInit();
  }

// update from database ========
  void deleteContact(Contact contact) async {
    try {
      loading = true;
      await repos.delete(contact.id!).then(
            (value) => contacts.removeWhere(
              (element) => element.id == contact.id,
            ),
          );
      print("============= contact deleted from database =======");
    } catch (e) {
      print("=========== catch error $e");
    }
    loading = false;
    update();
  }

  void callmaintenance(String telef) async {
    final Uri appel = Uri(scheme: 'tel', path: telef);
    await launchUrl(appel);
  }

  @override
  void onClose() {
    realTimeStream.cancel();
    streamSubscription.cancel();
    super.onClose();
  }
}
