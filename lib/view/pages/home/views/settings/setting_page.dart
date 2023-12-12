// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/theme/size_constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: Get.size.height,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            const AppBarSetting(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: padding10 * 1.5,
                      right: padding10 * 1.5,
                      top: padding10,
                    ),
                    child: TitleComponent(
                      title: "Information general :",
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  GetBuilder<SettingController>(
                    builder: (controller) {
                      return SocieteCard(
                        controller: controller,
                        onPressed: () {},
                      );
                    },
                  ),
                  const AddressSetting(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: padding10 * 1.5,
                      right: padding10 * 1.5,
                      top: padding10,
                    ),
                    child: TitleComponent(
                      title: "Parametre:",
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  ParametreCard(
                    title: "Rapports",
                    icons: Icons.bookmark_add_outlined,
                    onTap: () {
                      Get.toNamed(RouteName.reports);
                    },
                  ),
                  ParametreCard(
                    title: "General",
                    icons: Icons.edit_square,
                    onTap: () {
                      Get.toNamed(RouteName.editSetting);
                    },
                  ),
                  ParametreCard(
                    title: "A propos",
                    icons: Icons.read_more_sharp,
                    onTap: () {},
                  ),
                  ParametreCard(
                    title: "Licence ",
                    icons: Icons.library_add_check_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocieteCard extends StatelessWidget {
  const SocieteCard({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);
  final SettingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CardSetting(
      title: "Societé",
      subtitle: controller.entreprise == null
          ? "Nom de entreprise "
          : controller.entreprise!.name,
      logo: controller.imageEntreprise == null
          ? const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Icon(
                Icons.home_work,
                size: 25,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(
                30,
              ),
              child: Image.memory(
                controller.imageEntreprise!,
                width: 50,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
      onPressed: onPressed,
    );
  }
}

class AddressSetting extends StatelessWidget {
  const AddressSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return CardSetting(
        title: "Address",
        subtitle:
            controller.profile == null ? " " : controller.profile!.address,
        logo: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(
            Icons.home,
            size: 28,
          ),
        ),
        onPressed: () {},
      );
    });
  }
}

class AppBarSetting extends StatelessWidget {
  const AppBarSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      title: Text(
        "Profile",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      centerTitle: false,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: padding10,
          vertical: padding10,
        ),
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 3,
            ),
            GetBuilder<SettingController>(
              builder: (controller) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  child: controller.imageProfile == null
                      ? LottieBuilder.asset(
                          "assets/animations/profil.json",
                          fit: BoxFit.contain,
                          width: 250,
                        )
                      : Container(
                          width: Get.size.width * 0.37,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Get.size.width * 0.2,
                            ),
                            child: Image.memory(
                              controller.imageProfile!,
                              width: 120,
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                );
              },
            ),
            const SizedBox(
              height: padding10 * 1.5,
            ),
            GetBuilder<SettingController>(builder: (controller) {
              return controller.profile == null
                  ? const Text(
                      "Nom et Prenom : ",
                    )
                  : Text(
                      controller.profile!.name,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                    );
            }),
            const SizedBox(
              height: padding10 / 2,
            ),
            GetBuilder<SettingController>(builder: (controller) {
              return controller.profile == null
                  ? const Text(
                      "Poste Actuel : ",
                    )
                  : Text(
                      controller.profile!.post!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class ParametreCard extends StatelessWidget {
  const ParametreCard({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icons,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding10 / 2),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: padding10 / 2,
        vertical: padding10 / 5,
      ),
      child: ListTile(
        title: Text(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding10 / 2),
        ),
        horizontalTitleGap: 0.0,
        onTap: onTap,
        leading: Icon(icons),
      ),
    );
  }
}

class CardSetting extends StatelessWidget {
  const CardSetting({
    Key? key,
    required this.title,
    this.subtitle,
    this.logo,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Widget? logo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding10 / 2),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: padding10 / 2,
        vertical: padding10 / 5,
      ),
      child: ListTile(
        horizontalTitleGap: 10.0,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding10 / 2),
        ),
        leading: logo,
        title: Text(title),
        subtitle: Text(
          subtitle ?? "",
        ),
      ),
    );
  }
}
