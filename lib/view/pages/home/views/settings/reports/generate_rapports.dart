// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:telecom/report/pv_install.dart';
//import 'package:open_file/open_file.dart';
//import 'package:telecom/report/pv_install.dart';
import 'package:telecom/view/pages/home/start/components/get_back_button.dart';
//import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_page.dart';
import 'package:telecom/view/pages/home/views/settings/reports/retour_material/retour_material.dart';
import 'package:telecom/view/routes/route_name.dart';

class GenerateRapport extends StatelessWidget {
  const GenerateRapport({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const GetBackButton(),
        title: Text(
          "Generer Rapports",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            padding: const EdgeInsets.only(
              right: 15.0,
              left: 15.0,
              top: 15.0,
            ),
            children: [
              CardTitle(
                title: "Rapport Hebdomadaire",
                press: () {},
              ),
              CardTitle(
                title: "Demande Retour Materials",
                press: () {
                  Get.to(
                    () => const RetourMaterial(),
                  );
                },
              ),
              CardTitle(
                title: "Rapport Qualité ",
                press: () {
                  Get.toNamed(RouteName.reportQualite);
                },
              ),
              CardTitle(
                title: "Rapport RFI",
                press: () async {
                  Get.toNamed(RouteName.surveySite);
                  //   final file = await SurveyRfiExcel.createExcel();
                  //  await OpenFile.open(file.path);
                  //  print("file $file");
                },
              ),
              CardTitle(
                title: "Pv de Reception B2B",
                press: () async {
                  Get.toNamed(RouteName.pvReception);
                  // Get.to(
                  //   () => const PvReceptionPage(),
                  // );
                },
              ),
              CardTitle(
                title: "Pv de Demontage B2B",
                press: () {
                  Get.toNamed(RouteName.pvDemontage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({
    Key? key,
    required this.press,
    required this.title,
  }) : super(key: key);
  final VoidCallback press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      margin: const EdgeInsets.only(bottom: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        onTap: press,
        selectedColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        title: Text(
          title,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
        ),
      ),
    );
  }
}
