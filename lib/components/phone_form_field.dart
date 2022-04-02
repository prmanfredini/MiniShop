import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneFormField extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;
  final TextEditingController controller;

  const PhoneFormField({Key? key,
    required this.controller,
    required this.label,
    required this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Não pode estar em branco';
          }
          return null;
        },
        scrollPadding: EdgeInsets.zero,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          errorMaxLines: 2,
          labelText: label,
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          formatter,
        ],
      );
}
