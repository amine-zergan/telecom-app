// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:telecom/view/pages/home/start/components/get_back_button.dart';
import 'package:telecom/view/pages/home/start/site/components/add_button.dart';

class AppBarCreate extends StatelessWidget implements PreferredSizeWidget {
  AppBarCreate(
      {super.key,
      required this.title,
      required this.validate,
      this.icon = Icons.check});
  final String title;
  final VoidCallback validate;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      //backgroundColor: Colors.grey.shade800,
      elevation: 1,
      centerTitle: true,
      leading: const GetBackButton(),
      actions: [
        AddButton(
          press: validate,
          icon: icon,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
