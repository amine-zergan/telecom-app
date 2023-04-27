// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linearprogress/linearprogress.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final double index;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: LinearProgress(
          value: index,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          background: Colors.grey.shade100,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          gradients: const [
            Colors.white,
            Color.fromARGB(255, 113, 31, 255),
            Color.fromARGB(255, 67, 0, 183),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
