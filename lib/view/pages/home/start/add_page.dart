// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/body_create_object.dart';

class CreateObjectPage extends StatelessWidget {
  const CreateObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Colors.grey.shade800,
      body: BodyCreateObject(),
    );
  }
}
