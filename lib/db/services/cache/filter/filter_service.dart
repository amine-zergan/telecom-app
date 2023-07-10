// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telecom/db/services/cache/filter/constant_params_filter.dart';

import 'package:telecom/utils/converter/enum/order_post.dart';

abstract class FilterServiceRepository {
  Future<double> readLimitSearch();
  Future<List<String>?> readPostsSearch();
  Future<OrderContact?> readOrderFilter();
  Future<void> saveLimit(double value);
  Future<void> saveListPostSearch(List<String> value);
  Future<void> saveOrderFilter(OrderContact value);
}

class RemoteImplFilterServiceRepository extends FilterServiceRepository {
  final SharedPreferences preferences;
  RemoteImplFilterServiceRepository({
    required this.preferences,
  });

  @override
  Future<double> readLimitSearch() async {
    final value = preferences.getDouble(slider);
    print("=============== read limit $value ================");
    return value ?? 0.0;
  }

  @override
  Future<OrderContact?> readOrderFilter() async {
    final contactOrder = preferences.getString(orderFilter);
    print("=============== readcontact $contactOrder ================");
    return contactOrder != null
        ? OrderParse.fromString(contactOrder)
        : OrderContact.nom;
  }

  @override
  Future<List<String>?> readPostsSearch() async {
    final response = preferences.getStringList(listPosts);
    print("=============== readPost $response ================");
    return response;
  }

  @override
  Future<void> saveLimit(double value) async {
    await preferences.setDouble(slider, value);
    print("=============== save limit with succes $value ================");
  }

  @override
  Future<void> saveListPostSearch(List<String> value) async {
    await preferences.setStringList(listPosts, value);
    print("=============== save Post with succes $value ================");
  }

  @override
  Future<void> saveOrderFilter(OrderContact value) async {
    await preferences.setString(orderFilter, value.name);
    print("=============== save Order with succes $value ================");
  }
}
