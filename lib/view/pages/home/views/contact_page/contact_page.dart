// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/app_bar_contact.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/list_contact_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/loading_contact_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ContactController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              const AppBarContact(),
              controller.loading
                  ? const LoadingDataContact()
                  : ListContactView(
                      controller: controller,
                    ),
            ],
          );
        },
      ),
    );
  }
}
