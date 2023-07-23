import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:telecom/view/pages/home/views/navigation/components/navigation_search.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';

class NavigatorIconButton extends StatelessWidget {
  const NavigatorIconButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SearchComponent(
                controller: controller,
              );
            });
      },
      splashRadius: 20,
      icon: Transform.rotate(
        angle: math.pi / 6.0,
        child: const Icon(
          Icons.navigation_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
