import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/navigation/components/backgroudn_app_bar.dart';
import 'package:telecom/view/pages/home/views/navigation/components/navigation_icon_view.dart';
import 'package:telecom/view/pages/home/views/navigation/components/search_delegate.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';

class AppBarNavigation extends StatelessWidget {
  const AppBarNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      elevation: 0,
      pinned: true,
      floating: true,
      snap: true,
      actions: [
        GetBuilder<NavigationController>(builder: (controller) {
          return NavigatorIconButton(
            controller: controller,
          );
        }),
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: NavigationSearch(),
            );
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
        ),
      ],
      backgroundColor: Colors.grey.shade800,
      flexibleSpace: const BackgroundAppBar(),
    );
  }
}
