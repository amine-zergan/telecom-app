import 'package:flutter/material.dart';
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

class _SurveySitePageState extends State<SurveySitePage> {
  SiteType site = SiteType.nodal;

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
              RadioListTile(
                value: SiteType.nodal,
                title: const Text("Site Nodal"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: site,
                onChanged: updateTypeSite,
              ),
              RadioListTile(
                value: SiteType.agg,
                title: const Text("Site Agg"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: site,
                onChanged: updateTypeSite,
              ),
              RadioListTile(
                value: SiteType.ter,
                title: const Text("Site Terminal"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: site,
                onChanged: updateTypeSite,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey OutDoor :",
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("metrage de pylone"),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "45 m"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                // color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Support Antenne"),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: "commentaire"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Support bracon si existe :"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Baterre de Terre No_01 :"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Tremie :"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Chemin de cable V :"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Chemin de cable H:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
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
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("BTS:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Chemin de cable :"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Rack espace:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("DC:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("AC:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("GND:"),
                    ),
                    Expanded(
                      child: Switch(
                        value: bracon,
                        inactiveThumbColor: primaryColor,
                        thumbIcon: const MaterialStatePropertyAll(
                          Icon(
                            Icons.comment,
                          ),
                        ),
                        onChanged: updatebutton,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                //color: Colors.amber,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("CLIM:"),
                    ),
                    Expanded(
                      flex: 3,
                      child: Checkbox(
                        value: bracon,
                        onChanged: (value) {
                          updatebutton(value!);
                        },
                      ),
                    )
                  ],
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
