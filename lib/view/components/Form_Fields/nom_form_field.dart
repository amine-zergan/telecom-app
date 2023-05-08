// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../validators/profil/profile_validator.dart';

class NomFormField extends StatelessWidget {
  NomFormField(
      {Key? key,
      required this.controller,
      this.onSaved,
      this.onEditComplete,
      this.labelText,
      this.hintText,
      this.focusNode,
      this.onChanged,
      this.maxLine = 1,
      this.maxlength,
      this.inputFormatters,
      this.keyboardType,
      this.validator = ValidatorProfile.validatorName})
      : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String? value)? onChanged;
  int? maxLine;
  final int? maxlength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autocorrect: false,
      keyboardType: keyboardType,
      maxLines: maxLine,
      maxLength: maxlength,
      textCapitalization: TextCapitalization.words,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      onChanged: onChanged,
      controller: controller,
      onEditingComplete: onEditComplete,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
