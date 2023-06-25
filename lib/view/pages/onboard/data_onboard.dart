// ignore_for_file: public_member_api_docs, sort_constructors_first
class Onboard {
  final String title;
  final String image;
  final String description;
  const Onboard({
    required this.title,
    required this.image,
    required this.description,
  });
}

const List<Onboard> dataOnboard = [
  Onboard(
    title: "Planifier Les Activités",
    image: "assets/svg/dashbord.svg",
    description:
        "Gerer, planifier et consulter votre activites et votre taches du travail  ",
  ),
  Onboard(
    title: "Choisir La Destination",
    image: "assets/svg/roadmap.svg",
    description:
        "Naviguer facilement en mettre les coordonnées de site ou la destination souhaitée en simple clique",
  ),
  Onboard(
    title: "Gestion de Rapport D'activité",
    image: "assets/svg/reporting.svg",
    description:
        "Creer votre Rapport RFI, DPM, DRM, ouverture et cloture de Mission ",
  ),
  Onboard(
    title: "Gestion De Repetoire ",
    image: "assets/svg/contact.svg",
    description:
        " Creer et organiser votre list contact. Ajouter votre collegues de travail",
  ),
];
