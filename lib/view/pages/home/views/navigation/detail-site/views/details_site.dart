// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/pages/home/views/navigation/detail-site/views/controllers/detail_site_controller.dart';

class DetailSite extends StatefulWidget {
  const DetailSite({super.key});

  @override
  State<DetailSite> createState() => _DetailSiteState();
}

class _DetailSiteState extends State<DetailSite> {
  late Site site;
  @override
  void initState() {
    site = Get.arguments;
    print("=========== site fetched from navigation ");
    super.initState();
  }

  @override
  void dispose() {
    print("called function when we close the page");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<DetailSiteController>().navigateToSite(
            site.latitude,
            site.longitude,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.gps_fixed_outlined,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: Text(
          site.name.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                left: 0,
                child: Container(
                  height: size.height * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/route.png",
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.63,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleConfig(
                          title: "Opeateur :",
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            site.operator.operator,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          leading: Image.asset(site.operator.image),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TitleConfig(
                          title: "Responsable :",
                          padding: 5.0,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0.0,
                          title: Text(
                            site.responsable ?? "",
                          ),
                          subtitle: Text(
                            site.phone ?? "",
                          ),
                          leading: const Icon(
                            Icons.emoji_people_outlined,
                            size: 30,
                          ),
                        ),
                        TitleConfig(title: "Position Gps"),
                        Container(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            children: [
                              Expanded(
                                child: LottieBuilder.asset(
                                  "assets/animations/active_gps.json",
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Latitude : ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        Text(
                                          site.latitude,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Longitude : ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        Text(
                                          site.longitude,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        TitleConfig(title: "Description"),
                        Text(
                          site.description ?? "",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
