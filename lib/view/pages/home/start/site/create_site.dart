// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/components/Form_Fields/Longitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/description_form_field.dart';
import 'package:telecom/view/components/Form_Fields/latitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/site/components/check_card_tile.dart';
import 'package:telecom/view/pages/home/start/site/components/list_operator_card_view.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/theme/size_constants.dart';

class StartSite extends StatefulWidget {
  const StartSite({super.key});

  @override
  State<StartSite> createState() => _StartSiteState();
}

class _StartSiteState extends State<StartSite> {
  bool position = false;
  int? selectedIndex;
  int? selectedRegion;
  late TextEditingController description;
  late TextEditingController longitude;
  late TextEditingController latitude;
  late TextEditingController site;
  late TextEditingController maintenancier;
  late TextEditingController contact;
  @override
  void initState() {
    description = TextEditingController();
    longitude = TextEditingController();
    latitude = TextEditingController();
    site = TextEditingController();
    maintenancier = TextEditingController();
    contact = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    longitude.dispose();
    latitude.dispose();
    site.dispose();
    maintenancier.dispose();
    contact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBarCreate(
          title: "Nouveau Site",
          validate: () {},
        ),
        body: SafeArea(
          bottom: false,
          child: Form(
            child: ListView(
              padding: const EdgeInsets.all(padding10 * 1.5),
              children: [
                const Introtitle(
                  title:
                      """Creer, Sauvegarder les coordonnes de site, le maintenancier et leur contact.""",
                ),
                const SizedBox(
                  height: padding10,
                ),
                ListOperatorCard(
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      // ignore: avoid_print
                      print(index);
                    });
                  },
                ),
                const SizedBox(
                  height: 1.5 * padding10,
                ),
                const TitleComponent(title: "Nom et Coordonnées :"),
                const SizedBox(
                  height: padding10,
                ),
                Column(
                  children: [
                    NomFormField(
                      controller: site,
                      hintText: "Site_0001",
                      labelText: "Nom Site",
                    ),
                    const SizedBox(
                      height: padding10 / 2,
                    ),
                    CheckCardTile(
                      value: position,
                      onChanged: (value) {
                        setState(() {
                          position = value!;
                        });
                      },
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: position == false
                          ? Column(
                              key: const ValueKey("1"),
                              children: [
                                const SizedBox(
                                  height: padding10,
                                ),
                                LongitudeFormField(
                                  controller: longitude,
                                  onEditCompleted: () {},
                                ),
                                const SizedBox(
                                  height: padding10,
                                ),
                                LatitudeFormField(
                                  controller: latitude,
                                  onEditCompleted: () {},
                                ),
                              ],
                            )
                          : Container(
                              key: const ValueKey("2"),
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: padding10,
                ),
                const TitleComponent(
                  title: "Site Info et Contact :",
                ),
                const SizedBox(
                  height: padding10,
                ),
                NomFormField(
                  controller: maintenancier,
                  hintText: "nom ...",
                  labelText: "Nom de Maintenancier",
                ),
                const SizedBox(
                  height: padding10,
                ),
                PhoneFormField(
                  controller: contact,
                  labelText: "Contact de Maintenancier",
                ),
                const SizedBox(
                  height: padding10,
                ),
                const SubTitleComponent(
                  title: "Le Gouvernant ou Region :",
                ),
                Container(
                  width: size.width,
                  height: 50,
                  margin: const EdgeInsets.only(
                    top: padding10,
                  ),
                  child: ListView.builder(
                    itemCount: region.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      String nom = region[index];
                      return Card(
                        elevation: 0,
                        margin: const EdgeInsets.only(right: 10),
                        color: selectedRegion == index
                            ? Colors.white
                            : Colors.black26,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedRegion = index;
                            });
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1.5 * padding10),
                              child: Text(
                                nom,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: selectedRegion == index
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: padding10,
                ),
                const SubTitleComponent(
                  title: "Description :",
                ),
                const SizedBox(
                  height: padding10,
                ),
                DescriptionFormField(
                  controller: description,
                  onEditComplete: () {},
                  hintText:
                      "Ajouter un autre contact de maintenancier ou un indice ...",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubTitleComponent extends StatelessWidget {
  const SubTitleComponent({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
