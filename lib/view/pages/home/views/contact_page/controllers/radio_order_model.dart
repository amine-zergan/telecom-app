// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:telecom/helpers/utils/converter/enum/order_post.dart';

class OrderModel {
  final String title;
  final OrderContact contact;
  OrderModel({
    required this.title,
    required this.contact,
  });
}

List<OrderModel> ordermodelsList = [
  OrderModel(
    title: "Nom de Contact",
    contact: OrderContact.nom,
  ),
  OrderModel(
    title: "Numero de Contact",
    contact: OrderContact.numero,
  ),
  OrderModel(
    title: "Post de Contact",
    contact: OrderContact.post,
  ),
];
