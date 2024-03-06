// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_page.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/site_type.dart';
import 'package:telecom/view/theme/color_constants.dart';

import '../../../../../../../report/rfi_excel.dart';

class SurveySitePage extends StatefulWidget {
  const SurveySitePage({super.key});

  @override
  State<SurveySitePage> createState() => _SurveySitePageState();
}

class _SurveySitePageState extends State<SurveySitePage>
    with TickerProviderStateMixin {
  /// ------- animation has two steps :
  /// controller : forward- cancel  - repeat - reverse
  /// animation : TweenAnimation : color - double integer - begin w end
  /// TickerProviderStateMexin vsync This

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    )..addListener(() {});
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  SiteType site = SiteType.nodal;
  double slider = 50.0;
  bool bracon = false;

  void updatebutton(bool value) {
    setState(() {
      bracon = value;
    });
  }

  void updateTypeSite(SiteType? value) {
    setState(() {
      site = value!;
      print("la type de site $site est change");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final file = await SurveyRfiExcel.createExcel();
          await OpenFile.open(file.path);
        },
        elevation: 10,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.create,
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        title: Text(
          "Creation Rapport Qualité",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: Get.height,
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FormSiteComponent(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  formStateKey: const Key(""),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Text(
                  "Type de Site :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Wrap(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Text("Nodal"),
                  ),
                  Chip(
                    label: Text("Agg"),
                  ),
                  Chip(
                    label: Text("Terminal"),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey OutDoor :",
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,

                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                //color: Colors.amber,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Metrage de Pylone",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: AnimatedBuilder(
                                animation: controller,
                                builder: (context, child) {
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                      0,
                                      size.height * animation.value,
                                      0,
                                    ),
                                    child: Slider(
                                      value: slider,
                                      allowedInteraction:
                                          SliderInteraction.tapOnly,
                                      divisions: 2,
                                      min: 2,
                                      max: 110.0,
                                      label: "${slider.toInt()}",
                                      onChanged: (value) {
                                        setState(() {
                                          slider = value;
                                        });
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.only(
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${slider.toInt()} m",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 90,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Support Antenne",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "commentaire",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ComponentItem(
                title: "Support bracon si existe :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Baterre de Terre No_01 :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Tremie :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Chemin de cable V :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Chemin de cable H:",
                isExist: bracon,
                onChanged: (value) {},
              ),
              TitleComponentTask(
                title: "Selectionnez les images outdoor",
                isActive: false,
                onTap: () {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey InDoor :",
                ),
              ),
              ComponentItem(
                title: "BTS:",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Chemin de cable :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Rack espace:",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "DC :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "AC :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "GND :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              ComponentItem(
                title: "Clim :",
                isExist: bracon,
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    hintText: "Ajouter les details RFI...",
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TitleComponentTask(
                title: "Selectionnez les images indoor",
                isActive: false,
                onTap: () {},
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentItem extends StatelessWidget {
  const ComponentItem({
    Key? key,
    required this.title,
    required this.isExist,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final bool isExist;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 15),
      //color: Colors.amber,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Text("Non"),
                const SizedBox(
                  width: 5,
                ),
                Switch(
                  value: isExist,
                  activeTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: primaryColor,
                  thumbColor: MaterialStatePropertyAll(
                    primaryColor,
                  ),
                  onChanged: onChanged,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "oui",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
