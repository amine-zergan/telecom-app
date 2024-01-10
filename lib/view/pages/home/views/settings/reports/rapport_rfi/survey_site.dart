import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_page.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';

enum Site { nodal, agg, ter }

class SurveySitePage extends StatelessWidget {
  const SurveySitePage({super.key});

  final Site site = Site.nodal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //await controller.generateQaRapport();
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
                value: site,
                title: const Text("Site Nodal"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: Site.nodal,
                onChanged: (value) {},
              ),
              RadioListTile(
                value: site,
                title: const Text("Site Agg"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: Site.agg,
                onChanged: (value) {},
              ),
              RadioListTile(
                value: site,
                title: const Text("Site Terminal"),
                contentPadding: const EdgeInsets.only(left: 15.0),
                groupValue: Site.ter,
                onChanged: (value) {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey OutDoor :",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey InDoor :",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
