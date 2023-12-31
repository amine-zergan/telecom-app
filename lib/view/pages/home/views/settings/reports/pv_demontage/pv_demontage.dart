import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/validators/client_validator.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_demontage/pv_demontage_controller.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_page.dart';

class PvDemontagePage extends GetWidget<PvDemontageController> {
  const PvDemontagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPvReceptionOrDemontage(
        title: "Pv de recuperation de materiels",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.generatePvReception();
        },
        elevation: 10,
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.file_open,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CardTitleClientInfo(
                  title: "information de Client :",
                ),
                Form(
                  key: controller.formvalidation,
                  child: Column(
                    children: [
                      FormFieldTextB2B(
                        controller: controller.societeField,
                        focusNode: controller.societe,
                        labelText: "Nom de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.address);
                        },
                        validator: ClientValidator.validateEntreprise,
                      ),
                      FormFieldTextB2B(
                        controller: controller.addressField,
                        focusNode: controller.address,
                        labelText: "Address de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.responsable);
                        },
                        validator: ClientValidator.validateAddress,
                      ),
                      FormFieldTextB2B(
                        controller: controller.responsableField,
                        focusNode: controller.responsable,
                        labelText: "Responsable ",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.contact);
                        },
                        validator: ClientValidator.validateResponsable,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhoneFormField(
                          controller: controller.contactField,
                          focusNode: controller.contact,
                          labelText: "Contact Responsable",
                          onEditComplete: () {
                            FocusScope.of(context)
                                .requestFocus(controller.routeur);
                          },
                        ),
                      ),
                      const CardTitleClientInfo(
                        title: "List de Materiels A recuperer",
                      ),
                      FormFieldTextB2B(
                        controller: controller.routeurField,
                        focusNode: controller.routeur,
                        labelText: "Routeur LBB",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.antenne);
                        },
                        validator: (value) {},
                      ),
                      FormFieldTextB2B(
                        controller: controller.antenneField,
                        focusNode: controller.antenne,
                        labelText: "Antenne ",
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.coaxial);
                        },
                        validator: (value) {},
                      ),
                      FormFieldTextB2B(
                        controller: controller.coaxialField,
                        focusNode: controller.coaxial,
                        labelText: "Longueur cable Coaxial",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(controller.idu);
                        },
                        validator: (value) {},
                      ),
                      FormFieldTextB2B(
                        controller: controller.iduField,
                        focusNode: controller.idu,
                        labelText: "Type d'idu",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(controller.radio);
                        },
                        validator: (value) {},
                      ),
                      FormFieldTextB2B(
                        controller: controller.radioField,
                        focusNode: controller.radio,
                        labelText: "Type de Radio",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: (value) {},
                      ),
                      const SizedBox(
                        height: 300,
                      )
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
