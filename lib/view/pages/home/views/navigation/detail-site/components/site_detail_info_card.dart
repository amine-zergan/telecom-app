import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class SiteDetailInfoCard extends StatelessWidget {
  const SiteDetailInfoCard({
    super.key,
    required this.size,
    required this.site,
  });

  final Size size;
  final Site site;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              SizedBox(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                style: Theme.of(context).textTheme.titleMedium,
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
                                style: Theme.of(context).textTheme.titleMedium,
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
    );
  }
}
