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
    title: "Planifie Les Activités",
    image: "assets/svg/dashbord.svg",
    description:
        "Gerer, planifier et consulter  vos activites et vos taches de travail  ",
  ),
  Onboard(
    title: "Choisir La Destination",
    image: "assets/svg/roadmap.svg",
    description:
        "Naviguer facilement en mettre la coordonnée de site ou la destination souhaitée en simple clique",
  ),
  Onboard(
    title: "Gestion de Rapport D'activité",
    image: "assets/svg/reporting.svg",
    description:
        "creer vos Rapport RFI, DPM, DRM, ouverture et cloture de Mission ",
  ),
  Onboard(
    title: "Gestion De Repetoire ",
    image: "assets/svg/contact.svg",
    description:
        " creer, organiser votre list contact et ajouter vos collegues de travail",
  ),
];
