// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:telecom/utils/input_formatter/phone_formater.dart';
import 'package:telecom/validators/profil/profile_validator.dart';

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
    // ignore: avoid_print
    print("form Phone build with update");
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      autocorrect: false,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
