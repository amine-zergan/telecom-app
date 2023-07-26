import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/get_back_button.dart';

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
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Ouverture Mission",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Cloture Mission",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Demande Preparation materials ",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Creer Demande Retour Materials",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Rapport Qualité ",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: const Text(
                      "Survey Site ",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
