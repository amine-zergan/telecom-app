// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../components/app_bar_view.dart';

class StartMission extends StatefulWidget {
  const StartMission({super.key});

  @override
  State<StartMission> createState() => _StartMissionState();
}

class _StartMissionState extends State<StartMission> {
  String? duration = "un jour";

  DateTime? _day;

  bool enEquipe = false;
  bool enDeplacement = false;
  late TextEditingController nomVehicule;
  late TextEditingController person;
  late TextEditingController indexVehicule;
  late TextEditingController tarif;
  late TextEditingController site;
  int bonCarburant = 1;
  int jourdep = 1;

  List<String> equipes = [];
  List<String> sites = [];

  @override
  void initState() {
    nomVehicule = TextEditingController();
    indexVehicule = TextEditingController();
    tarif = TextEditingController();
    site = TextEditingController();
    person = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nomVehicule.dispose();
    indexVehicule.dispose();
    tarif.dispose();
    site.dispose();
    person.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Creation Mission",
        validate: () async {},
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(
            1.5 * padding10,
          ),
          children: [
            const Introtitle(
              title:
                  "Commencer à ouvrir votre mission et la suivie jusqu'à la cloturée et organiser votre taches et dépenses",
            ),
            const SizedBox(
              height: 2 * padding10,
            ),
            const TitleComponent(
              title: "Mission et Dépense :",
            ),
            const SizedBox(
              height: padding10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SubTitleComponent(
                      title: "Date de depart :",
                    ),
                    Text(
                      _day == null ? "" : _day!.toString(),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    _day = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2027),
                    );
                  },
                  child: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: padding10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitleComponent(
                  title: "Nombre de jour estimé :",
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(padding10 / 2),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        alignment: Alignment.topCenter,
                        value: duration,
                        isDense: true,
                        dropdownColor: Colors.grey.shade900,
                        itemHeight: 50,
                        elevation: 0,
                        onChanged: (value) {
                          setState(() {
                            duration = value;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: "un jour",
                            child: Text(
                              "un jour",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "deux jours",
                            child: Text("deux jours"),
                          ),
                          DropdownMenuItem(
                            value: "trois jours",
                            child: Text("trois jours"),
                          ),
                          DropdownMenuItem(
                            value: "une semaine",
                            child: Text("une semaine"),
                          ),
                          DropdownMenuItem(
                            value: "deux semaines",
                            child: Text("deux semaines"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: padding10 / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitleComponent(
                  title: "Mission en equipe ?",
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          enEquipe = true;
                        });
                      },
                      child: const Text("oui"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          enEquipe = false;
                        });
                      },
                      child: const Text(
                        "Non",
                      ),
                    )
                  ],
                )
              ],
            ),
            enEquipe
                ? Center(
                    child: TextButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierColor: Colors.black26,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                content: Column(
                                  children: [
                                    const Text(
                                      "Vos collegues en mission",
                                    ),
                                    const SizedBox(
                                      height: padding10,
                                    ),
                                    CupertinoTextField(
                                      controller: person,
                                      autocorrect: false,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Colors.black38),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "Retour",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (person.text.isNotEmpty) {
                                          equipes.add(person.text);
                                          person.clear();
                                        }
                                      });
                                    },
                                    child: const Text(
                                      "Ajouter",
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add_home_sharp),
                      label: const Text("Ajouter equipe"),
                    ),
                  )
                : Container(),
            ...List.generate(equipes.length, (index) {
              String nom = equipes[index];
              return enEquipe
                  ? ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        nom,
                        style:
                            Theme.of(context).textTheme.labelLarge!.copyWith(),
                      ),
                      trailing: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  content: Text(
                                    "voulez vous enlever $nom depuis cette mission",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Retour"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          equipes.removeAt(index);
                                        });

                                        Get.back();
                                      },
                                      child: const Text("Confirm"),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.remove_circle_outline,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  : Container();
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitleComponent(
                  title: "Mission en deplacement ?",
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          enDeplacement = true;
                        });
                      },
                      child: const Text("oui"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          enDeplacement = false;
                        });
                      },
                      child: const Text("Non"),
                    )
                  ],
                )
              ],
            ),
            enDeplacement
                ? Column(
                    children: [
                      AddandRemouveComponent(
                        title: "jour en deplacement:",
                        bonCarburant: jourdep,
                        increase: () {
                          setState(() {
                            jourdep++;
                          });
                        },
                        decrease: () {
                          setState(() {
                            if (jourdep > 0) {
                              jourdep--;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: padding10,
                      ),
                      NomFormField(
                        labelText: "frais de deplacement",
                        hintText: "tarif de deplacement en dinar",
                        controller: tarif,
                      ),
                    ],
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitleComponent(
                  title: "Codes sites :",
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierColor: Colors.black26,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Column(
                              children: [
                                const Text(
                                  "Ajouter les code sites ",
                                ),
                                const SizedBox(
                                  height: padding10,
                                ),
                                CupertinoTextField(
                                  controller: site,
                                  autocorrect: false,
                                  cursorColor: Colors.white,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: const BoxDecoration(
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "Retour",
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (site.text.isNotEmpty) {
                                      sites.add(site.text);
                                      site.clear();
                                    }
                                  });
                                },
                                child: const Text(
                                  "Ajouter",
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Ajouter"),
                )
              ],
            ),
            Wrap(
              spacing: 15.0,
              direction: Axis.horizontal,
              children: List<Widget>.generate(
                sites.length,
                (int index) {
                  final site = sites[index];
                  return Chip(
                    label: GestureDetector(
                      onTap: () {
                        setState(() {
                          sites.removeAt(index);
                        });
                      },
                      child: Text(
                        site,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    autofocus: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10.0),
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: padding10 / 2,
            ),
            const TitleComponent(
              title: "Transport :",
            ),
            const SizedBox(
              height: padding10,
            ),
            const SubTitleComponent(
              title: "Vehicule et carburant :",
            ),
            const SizedBox(
              height: 1.5 * padding10,
            ),
            NomFormField(
              labelText: "Nom de Vehicule",
              hintText: "Tata 240-Tunis-98xx",
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: padding10,
            ),
            NomFormField(
              controller: TextEditingController(),
              labelText: "Index de depart",
              hintText: "index en km",
            ),
            const SizedBox(
              height: padding10 / 2,
            ),
            AddandRemouveComponent(
              title: "Bon de carburants :",
              bonCarburant: bonCarburant,
              increase: () {
                setState(() {
                  bonCarburant++;
                });
              },
              decrease: () {
                setState(() {
                  if (bonCarburant > 1) {
                    bonCarburant--;
                  }
                });
              },
            ),
            const SizedBox(
              height: padding10,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddandRemouveComponent extends StatelessWidget {
  const AddandRemouveComponent({
    Key? key,
    required this.title,
    this.increase,
    this.decrease,
    required this.bonCarburant,
  }) : super(key: key);
  final String title;
  final int bonCarburant;
  final VoidCallback? increase;
  final VoidCallback? decrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubTitleComponent(
          title: title,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: decrease,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade800,
                ),
              ),
              child: const Icon(
                Icons.remove_outlined,
                size: 20,
              ),
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            Text(
              bonCarburant.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            TextButton(
              onPressed: increase,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade800,
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
