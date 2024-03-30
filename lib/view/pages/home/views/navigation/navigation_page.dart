// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:telecom/view/pages/home/views/navigation/components/appbar_navigation_view.dart';
import 'package:telecom/view/pages/home/views/navigation/components/emty_navigation_view.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';
import 'package:telecom/view/routes/route_name.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(builder: (controller) {
        return SizedBox(
          //color: const Color.fromARGB(137, 250, 125, 125),
          width: double.infinity,
          height: Get.size.height,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              const AppBarNavigation(),
              SliverPadding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                sliver: controller.allSite.isEmpty
                    ? const EmptyNavigationView()
                    : SliverGrid.builder(
                        itemCount: controller.allSite.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) {
                          Site site = controller.allSite[index];
                          return Card(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                // margin: const EdgeInsets.only(
                                //  bottom: 5.0,
                                //  ),
                                decoration: BoxDecoration(
                                  //color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          site.operator.image,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        //color: Colors.black12,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      site.name.toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 8.0,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.toNamed(
                                                          RouteName.detailSite,
                                                          arguments: site,
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ListTile(
                                                minLeadingWidth: 0,
                                                horizontalTitleGap: 0,
                                                contentPadding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15,
                                                  ),
                                                ),
                                                title: Text(
                                                  site.responsable!,
                                                ),
                                                subtitle: Text(
                                                  site.phone!,
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .makeCallMaintenancier(
                                                            site.phone!);
                                                  },
                                                  splashRadius: 20,
                                                  icon: const Icon(
                                                    Icons.phone,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
