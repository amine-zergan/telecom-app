// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../validators/profil/profile_validator.dart';

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
    this.labelText,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;
  final FocusNode? focusNode;

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
        hintText: "10-rue boulevard-Tunis",
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
