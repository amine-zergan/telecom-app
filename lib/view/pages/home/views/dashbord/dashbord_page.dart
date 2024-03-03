import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/view/pages/home/views/dashbord/components/dashbord_app_bar.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -50,
                        top: 10,
                        bottom: 10,
                        child: LottieBuilder.asset(
                          "assets/animations/home.json",
                          height: 70,
                          repeat: false,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bienvenue ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Amine Mejri",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Commencer votre \nMission de cette Semaine ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
