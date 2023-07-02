import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/dashbord/components/dashbord_app_bar.dart';

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
              const DashboardAppBar(),
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
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.05,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
