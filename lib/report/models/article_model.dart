// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:telecom/model/components/material_model.dart';

class Article {
  final int? id;
  final Equipement equipement;
  final int quantite;
  Article({
    this.id,
    required this.equipement,
    required this.quantite,
  });
}
