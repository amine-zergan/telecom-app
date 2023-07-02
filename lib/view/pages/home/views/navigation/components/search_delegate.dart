import 'package:flutter/material.dart';

class NavigationSearch extends SearchDelegate {
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
        size: 20,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text("title "),
    );
  }
}
