import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';
import 'package:telecom/model/site/site_model.dart';

class NavigationSearch extends SearchDelegate<String> {
  final NavigationController controller;

  NavigationSearch(this.controller);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, "");
      },
      child: const Icon(
        Icons.arrow_back_ios_new_outlined,
        size: 18,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final Site? site = controller.allSite
        .firstWhereOrNull((element) => element.name.toLowerCase() == query);
    return site != null
        ? Container(
            color: Colors.black26,
          )
        : Container(
            color: Colors.amber,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filters = controller.siteSuggestion
        .where((element) => element.toLowerCase().startsWith(query))
        .toList();
    return ListView.builder(
      itemCount:
          query == "" ? controller.siteSuggestion.length : filters.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        final item =
            query == "" ? controller.siteSuggestion[index] : filters[index];
        return ListTile(
          onTap: () {
            query = item;
          },
          title: Text(
            item,
          ),
        );
      },
    );
  }
}
