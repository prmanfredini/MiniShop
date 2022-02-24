import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneFormField extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;
  final TextEditingController controller;

  PhoneFormField({
    required this.controller,
    required this.label,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Este campo não pode estar em branco';
      }
      return null;
    },
    scrollPadding: EdgeInsets.zero,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior:FloatingLabelBehavior.always,
    ),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      formatter,
    ],
  );
}
