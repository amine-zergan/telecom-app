// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linearprogress/linearprogress.dart';

import '../../../theme/color_constants.dart';

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
          curve: Curves.easeInExpo,
          duration: const Duration(seconds: 1),
          background: Colors.grey.shade100,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          gradients: const [
            gradienColorEnd,
            gradienColorBegin,
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
