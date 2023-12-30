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
                const CardTitleClientInfo(),
                Form(
                  key: GlobalKey(),
                  child: Column(
                    children: [
                      FormFieldTextB2B(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Nom de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: ClientValidator.validateEntreprise,
                      ),
                      FormFieldTextB2B(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Address de l'entreprise",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: ClientValidator.validateAddress,
                      ),
                      FormFieldTextB2B(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Responsable ",
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: ClientValidator.validateResponsable,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhoneFormField(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          labelText: "Contact Responsable",
                          onEditComplete: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
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
