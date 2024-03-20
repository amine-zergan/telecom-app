import 'package:flutter/material.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ParametreCard extends StatelessWidget {
  const ParametreCard({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icons,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding10 / 2),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: padding10 / 2,
        vertical: padding10 / 5,
      ),
      child: ListTile(
        title: Text(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding10 / 2),
        ),
        horizontalTitleGap: 0.0,
        onTap: onTap,
        leading: Icon(icons),
      ),
    );
  }
}
