
import 'package:flutter/material.dart';

import '../../../../../validators/profil/profile_validator.dart';

class NomFormField extends StatelessWidget {
  const NomFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
    this.labelText,
    this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      inputFormatters: const [],
      onSaved: onSaved,
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
