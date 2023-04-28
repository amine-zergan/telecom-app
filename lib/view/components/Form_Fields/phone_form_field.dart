// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/validators/profil/profile_validator.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final FocusNode? focusNode;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      autocorrect: false,
      validator: ValidatorProfile.validatorPhone,
      inputFormatters: const [],
      onSaved: onSaved,
      onEditingComplete: onEditComplete,
      decoration: InputDecoration(
        hintText: "50 000 100",
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
