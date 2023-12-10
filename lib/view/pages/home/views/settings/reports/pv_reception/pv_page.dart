// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/validators/profil/profile_validator.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_controller.dart';

class PvReceptionPage extends GetWidget<PvReceptionController> {
  const PvReceptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Creation Pv Reception B2B",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (controller.formvalidation.currentState!.validate()) {
            // create file Pv de reception
            await controller.generatePvReception();
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.file_open,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Card(
                  child: ListTile(
                    title: Text("information de Client :"),
                  ),
                ),
                Form(
                  key: controller.formvalidation,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      FormFieldTextB2B(
                        controller: controller.societeField,
                        focusNode: controller.societe,
                        labelText: "Nom de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.address);
                        },
                        validator: controller.validateEntreprise,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormFieldTextB2B(
                        controller: controller.addressField,
                        focusNode: controller.address,
                        labelText: "Address de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.responsable);
                        },
                        validator: controller.validateAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormFieldTextB2B(
                        controller: controller.responsableField,
                        focusNode: controller.responsable,
                        labelText: "Responsable ",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.contact);
                        },
                        validator: controller.validateResponsable,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhoneFormField(
                          controller: controller.contactField,
                          focusNode: controller.contact,
                          labelText: "Contact Responsable",
                          onEditComplete: () {
                            FocusScope.of(context)
                                .requestFocus(controller.debit);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        child: ListTile(
                          title: Text(
                            "Debit Demandé Par le Client :",
                          ),
                        ),
                      ),
                      FormFieldTextB2B(
                        controller: controller.debitField,
                        focusNode: controller.debit,
                        labelText: "Saisi le debit demandée",
                        keyboardType: TextInputType.number,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          );
                        },
                        validator: controller.validateDebit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FormFieldTextB2B extends StatelessWidget {
  FormFieldTextB2B({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.onEditingComplete,
    this.focusNode,
    this.keyboardType,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller;
  void Function()? onEditingComplete;
  String? Function(String? value)? validator;
  TextInputType? keyboardType;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autocorrect: false,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
