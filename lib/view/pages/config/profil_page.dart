import 'package:flutter/material.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        children: [
          const TitleConfig(title: "Completer votre Profile"),
          Text(
            "Encore une seule etape pour configurer votre compte. Ajouter votre prenom, numero de telephone , image et votre address.",
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
                child: Icon(
                  Icons.image_search,
                  size: 30,
                  color: Colors.grey.shade400,
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
                      hintText: "nom et prenom",
                      labelText: "Saisi votre nom",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "10-rue boulevard-Tunis",
                      labelText: "Saisi votre address",
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
                      labelText: "Saisi votre code postale",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "50 000 100",
                      labelText: "Saisi votre numero",
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
