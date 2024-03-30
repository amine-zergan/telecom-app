// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/theme/size_constants.dart';

class EditSetting extends StatelessWidget {
  const EditSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              elevation: 10,
              pinned: true,
              backgroundColor: Colors.amber,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Parametre",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  centerTitle: false,
                  expandedTitleScale: 1.7,
                  titlePadding:
                      const EdgeInsetsDirectional.only(start: 60, bottom: 16)
                  // EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: padding10),
            ),
            CardTitleView(
              onTap: () {
                Get.toNamed(
                  RouteName.editProfil,
                );
              },
              title: "Edit Profile",
            ),
            CardTitleView(
              onTap: () {
                Get.toNamed(
                  RouteName.editEntreprise,
                );
              },
              title: "Edit Entreprise",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    top: padding10, left: padding10, bottom: padding10),
                child: Text("Configuration :"),
              ),
            ),
            CardTitleView(
              onTap: () {},
              title: "Equipe",
            ),
            CardTitleView(
              onTap: () {},
              title: "Chefs projet",
            ),
            CardTitleView(
              onTap: () {},
              title: "Frais de Deplacement",
            ),
            CardTitleView(
              onTap: () {},
              title: "Operateur",
            ),
            CardTitleView(
              onTap: () {},
              title: "Projet",
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardTitleView extends StatelessWidget {
  const CardTitleView({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: padding10 * 0.5,
        ),
        child: Card(
          elevation: 1,
          //color: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              padding10 * 0.5,
            ),
          ),
          child: ListTile(
            onTap: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                padding10 * 0.5,
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
