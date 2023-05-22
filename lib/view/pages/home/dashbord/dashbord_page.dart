import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/routes/route_name.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: Get.size.height,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                // expandedHeight: 300,
                elevation: 0,
                // collapsedHeight: 70,
                title: const Text("Dashborad"),
                pinned: false,
                floating: true,
                stretch: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(
                        RouteName.notification,
                      );
                    },
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.notification_important_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(
                        RouteName.history,
                      );
                    },
                    splashRadius: 20,
                    splashColor: Colors.transparent,
                    icon: const Icon(
                      Icons.manage_history_outlined,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: size.height * 0.2,
                  child: const Center(
                    child: Text(
                      "welcome Component + User Component",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.15,
                  color: Colors.black12,
                  child: const Center(
                    child: Text(
                      "Categories Components",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.4,
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Text(
                      "Current Mission",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height * 0.3,
                  child: const Center(
                    child: Text(
                      "Current Task with Report",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.5,
                  color: Colors.amber.shade900,
                  child: const Center(
                    child: Text(
                      "charts with Statistique",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.05,
                  //color: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
