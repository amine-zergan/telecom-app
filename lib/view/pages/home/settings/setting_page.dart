// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
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
            SliverAppBar(
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
                    ClipRRect(
                      child: LottieBuilder.asset(
                        "assets/animations/profil.json",
                        fit: BoxFit.cover,
                        width: 250,
                      ),
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    const Text(
                      "Nom et Prenom",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    const Text(
                      "Poste Actuel dans Entreprise",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    const Spacer(),
                  ],
                ),
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
                      title: "Information general :",
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  CardSetting(
                    title: "Societé",
                    subtitle: "Nom de entreprise ",
                    logo: const FlutterLogo(
                      style: FlutterLogoStyle.markOnly,
                    ),
                    onPressed: () {},
                  ),
                  CardSetting(
                    title: "Address",
                    subtitle: "Nom de entreprise ",
                    logo: const Icon(
                      Icons.home_outlined,
                    ),
                    onPressed: () {},
                  ),
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
                    onTap: () {},
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
                    title: "licence ",
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
    required this.logo,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Widget logo;
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
        horizontalTitleGap: 0.0,
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
