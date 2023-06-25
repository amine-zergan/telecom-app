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
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;
  final FocusNode? focusNode;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      autocorrect: false,
      validator: ValidatorProfile.validateAddress,
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
