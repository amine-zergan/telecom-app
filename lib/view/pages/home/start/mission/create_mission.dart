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

  bool enEquipe = false;
  bool enDeplacement = false;
  late TextEditingController nomVehicule;
  late TextEditingController person;
  late TextEditingController indexVehicule;
  late TextEditingController tarif;
  late TextEditingController nombrejour;
  int bonCarburant = 1;

  List<String> equipes = [];

  @override
  void initState() {
    nomVehicule = TextEditingController();
    indexVehicule = TextEditingController();
    tarif = TextEditingController();
    nombrejour = TextEditingController();
    person = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nomVehicule.dispose();
    indexVehicule.dispose();
    tarif.dispose();
    nombrejour.dispose();
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
                const SubTitleComponent(
                  title: "Date de depart :",
                ),
                InkWell(
                  onTap: () {},
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
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(padding10 / 2),
                      child: DropdownButton<String>(
                        alignment: Alignment.topCenter,
                        value: duration,
                        isDense: true,
                        dropdownColor: Colors.grey.withOpacity(1),
                        itemHeight: 50,
                        elevation: 10,
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
                                        "Ajouter vos collegues en mission"),
                                    const SizedBox(
                                      height: padding10,
                                    ),
                                    CupertinoTextField(
                                      controller: TextEditingController(),
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
                                      "cancel",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      equipes.add(person.text);
                                    },
                                    child: const Text(
                                      "done",
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
                      const SizedBox(
                        height: padding10 / 2,
                      ),
                      NomFormField(
                        labelText: "nombre de jour",
                        hintText: "nombre de jour en deplacement",
                        controller: tarif,
                      ),
                      const SizedBox(
                        height: padding10,
                      ),
                      NomFormField(
                        labelText: "frais de deplacement",
                        hintText: "tarif de deplacement en dinar",
                        controller: nombrejour,
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
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Ajouter"),
                )
              ],
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
              hintText: "Tata ....",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitleComponent(
                  title: "Bon de carburants :",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
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
                    const SizedBox(
                      width: padding10 / 2,
                    ),
                    Text(
                      "0",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: padding10 / 2,
                    ),
                    TextButton(
                      onPressed: () {},
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
                  ],
                )
              ],
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
