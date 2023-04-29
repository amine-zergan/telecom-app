// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../validators/profil/profile_validator.dart';

class NomFormField extends StatelessWidget {
  const NomFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
    this.labelText,
    this.hintText,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      inputFormatters: const [],
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditComplete,
      validator: ValidatorProfile.validatorName,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
