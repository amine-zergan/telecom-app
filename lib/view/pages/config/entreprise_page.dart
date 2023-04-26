import 'package:flutter/material.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ProfileEntreprisePage extends StatelessWidget {
  const ProfileEntreprisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        children: [
          const TitleConfig(title: "Completer profile Entreprise"),
          Text(
            "Ajouter les coordonnées de l'entreprise nom , logo et address pour utiliser lors de creation de rapports.",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: padding10,
          ),
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print("active button");
                  },
                  child: Icon(
                    Icons.image_search,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "nom ",
                      labelText: "Saisi le nom de l'entreprise",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "10-rue boulevard-Tunis",
                      labelText: "Saisi l'address",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "xxxx",
                      labelText: "Saisi code postale",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
