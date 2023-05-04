import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telecom/validators/profil/profile_validator.dart';

import '../../../utils/input_formatter/phone_formater.dart';

class PhoneFixFormField extends StatelessWidget {
  const PhoneFixFormField({
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
      validator: ValidatorProfile.validatorPhoneFix,
      inputFormatters: [
        PhoneFormatter(),
        LengthLimitingTextInputFormatter(10),
      ],
      onSaved: onSaved,
      onEditingComplete: onEditComplete,
      decoration: InputDecoration(
        hintText: "71 000 100",
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
