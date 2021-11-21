import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BioTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputAction? action;

  const BioTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.action,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (name) {
        if (name!.isEmpty) {
          'This form must be filled';
        } else {
          null;
        }
      },
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      textInputAction: action,
    );
  }
}
