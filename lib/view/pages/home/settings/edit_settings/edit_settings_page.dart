// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';

import 'package:telecom/view/theme/size_constants.dart';

class EditSetting extends StatelessWidget {
  const EditSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Parametre",
                ),
                centerTitle: false,
                expandedTitleScale: 1.6,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: padding10),
            ),
            CardTitleView(
              onTap: () {},
              title: "Edit Profile",
            ),
            CardTitleView(
              onTap: () {},
              title: "Edit Entreprise",
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    top: padding10, left: padding10, bottom: padding10),
                child: TitleComponent(title: "Configuration :"),
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
          ],
        ),
      ),
    );
  }
}

class CardTitleView extends StatelessWidget {
  const CardTitleView({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
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
          elevation: 0,
          color: Colors.grey.shade800,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding10 * 0.5)),
          child: ListTile(
            onTap: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding10 * 0.5),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
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
