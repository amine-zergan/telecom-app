// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/view/pages/home/start/components/get_back_button.dart';
import 'package:telecom/view/pages/home/start/site/components/add_button.dart';

class AppBarCreate extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreate({
    Key? key,
    required this.title,
    required this.validate,
  }) : super(key: key);
  final String title;
  final VoidCallback validate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.grey.shade800,
      elevation: 1,
      centerTitle: true,
      leading: const GetBackButton(),
      actions: [
        AddButton(
          press: validate,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
