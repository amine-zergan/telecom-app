// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  double slider = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //color: Colors.amber.shade200,
        width: double.infinity,
        height: Get.size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              elevation: 0,
              floating: true,
              snap: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      useSafeArea: false,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            padding10 * 2,
                          ),
                          topRight: Radius.circular(
                            padding10 * 2,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return const FilterView();
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 2.0,
                    ),
                    child: Icon(
                      Icons.segment_outlined,
                    ),
                  ),
                ),
                const SizedBox(
                  width: padding10,
                )
              ],
              flexibleSpace: const FlexibleSpaceBar(
                expandedTitleScale: 1.4,
                titlePadding: EdgeInsets.only(
                  bottom: padding10,
                  left: padding10,
                ),
                title: Text(
                  "Repertoire de contact",
                  textAlign: TextAlign.left,
                ),
                centerTitle: false,
                collapseMode: CollapseMode.none,
              ),
            ),
            const EmptyContactCard(),
          ],
        ),
      ),
    );
  }
}

class EmptyContactCard extends StatelessWidget {
  const EmptyContactCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Get.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_people_rounded,
              size: 150,
            ),
            const SizedBox(
              height: padding10,
            ),
            Text(
              "Repertoire vide",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: padding10,
            ),
            Text(
              "Commencer d'ajouter votre Contacts.\nOrganiser selon leur post occupée ",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterView extends StatefulWidget {
  const FilterView({
    super.key,
  });

  @override
  State<FilterView> createState() => _FilterViewState();
}

enum OrderContact { nom, numero, post }

class _FilterViewState extends State<FilterView> {
  double slider = 5.0;
  List<String> filters = [];

  OrderContact? _order = OrderContact.nom;

  @override
  Widget build(BuildContext context) {
    print("======== rebuild ========");
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        top: padding10 * 1.5,
        left: padding10 * 1.5,
        right: padding10 * 1.5,
      ),
      height: size.height * 0.75,
      child: ListView(
        children: [
          const TitleComponent(
            title: "Filters de Recherche :",
          ),
          const SizedBox(
            height: 2 * padding10,
          ),
          Row(
            children: [
              const SubTitleComponent(title: "Limit de recherche :"),
              const SizedBox(
                width: padding10,
              ),
              Text(
                slider.toInt().toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: padding10 / 2,
          ),
          Slider(
            value: slider,
            divisions: 10,
            activeColor: colorButton,
            inactiveColor: Colors.black12,
            min: 0,
            max: 30,
            onChanged: (value) {
              setState(() {
                slider = value;
              });
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "min : 0",
              ),
              Text(
                "max : 30",
              ),
            ],
          ),
          const SizedBox(
            height: padding10,
          ),
          const SubTitleComponent(
            title: "poste Occupée :",
          ),
          const SizedBox(
            height: padding10,
          ),
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: occupations
                .map(
                  (post) => FilterChip(
                    selected: filters.contains(post),
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          filters.add(post);
                        } else {
                          filters.remove(post);
                        }
                      });
                    },
                    elevation: 5,
                    label: Text(post),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: padding10,
          ),
          const TitleComponent(
            title: "Orders par :",
          ),
          const SizedBox(
            height: padding10,
          ),
          Row(
            children: [
              Radio<OrderContact>(
                activeColor: colorButton,
                value: OrderContact.nom,
                groupValue: _order,
                onChanged: (OrderContact? value) {
                  setState(() {
                    _order = value;
                  });
                },
              ),
              const SizedBox(
                width: padding10 / 2,
              ),
              const Text("Nom de Contact")
            ],
          ),
          Row(
            children: [
              Radio<OrderContact>(
                activeColor: colorButton,
                value: OrderContact.numero,
                groupValue: _order,
                onChanged: (OrderContact? value) {
                  setState(() {
                    _order = value;
                  });
                },
              ),
              const SizedBox(
                width: padding10 / 2,
              ),
              const Text("Numero de Contact")
            ],
          ),
          Row(
            children: [
              Radio<OrderContact>(
                activeColor: colorButton,
                value: OrderContact.post,
                groupValue: _order,
                onChanged: (OrderContact? value) {
                  setState(() {
                    _order = value;
                  });
                },
              ),
              const SizedBox(
                width: padding10 / 2,
              ),
              const Text("Post de Contact")
            ],
          )
        ],
      ),
    );
  }
}
