import 'package:flutter/material.dart';
import 'package:telecom/validators/profil/profile_validator.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      validator: ValidatorProfile.validatorPhone,
      inputFormatters: const [],
      onSaved: onSaved,
      onEditingComplete: onEditComplete,
      decoration: const InputDecoration(
        hintText: "50 000 100",
        labelText: "Saisi votre numero",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
