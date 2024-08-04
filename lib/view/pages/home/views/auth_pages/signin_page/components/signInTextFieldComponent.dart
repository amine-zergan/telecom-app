import 'package:flutter/material.dart';

class SignInTextFieldComponent extends StatelessWidget {
  const SignInTextFieldComponent({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.isObscure,
    required this.controller,
    this.validate,
    this.onToggle,
  });

  final String label;
  final String hint;
  final IconData? icon;
  final bool? isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final void Function()? onToggle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.grey.shade500),


        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.grey.shade400),
        // contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white,

        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            icon,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
