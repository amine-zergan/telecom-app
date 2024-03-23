// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:telecom/helpers/utils/input_formatter/phone_formater.dart';
import 'package:telecom/helpers/validators/profil/profile_validator.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onChanged,
    this.onEditComplete,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final Function()? onEditComplete;
  final FocusNode? focusNode;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      autocorrect: false,
      onChanged: onChanged,
      keyboardType: TextInputType.name,
      validator: ValidatorProfile.validatorPhone,
      inputFormatters: [
        PhoneFormatter(),
        LengthLimitingTextInputFormatter(10),
      ],
      onSaved: onSaved,
      onEditingComplete: onEditComplete,
      decoration: InputDecoration(
        hintText: "50 000 100",
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
    );
  }
}
