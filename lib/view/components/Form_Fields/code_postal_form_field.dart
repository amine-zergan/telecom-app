// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:telecom/validators/profil/profile_validator.dart';

class CodePostalFormField extends StatelessWidget {
  const CodePostalFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onChanged,
    this.onEditComplete,
    this.labelText,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final Function()? onEditComplete;
  final String? labelText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autocorrect: false,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditComplete,
      validator: ValidatorProfile.validatePoste,
      onSaved: onSaved,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: "xxxx",
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        focusedErrorBorder: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
