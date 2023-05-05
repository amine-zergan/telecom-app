// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/report/models/article_model.dart';

/// type of Report : dpm or drm

enum Report { dpm, drm }

class ReportLivraison {
  final int? id;
  final String ref;
  final Operator operator;
  final String demendeur;
  final String destination;
  final DateTime livraision;
  final List<Article> articles;
  final Report type;
  ReportLivraison({
    this.id,
    required this.ref,
    required this.operator,
    required this.demendeur,
    required this.destination,
    required this.livraision,
    required this.articles,
    required this.type,
  });
}
