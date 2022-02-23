import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField FormNumber(_controller, _label) {
  return TextFormField(
    controller: _controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Este campo não pode estar em branco';
      }
      return null;
    },
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    keyboardType: TextInputType.number,
    scrollPadding: EdgeInsets.zero,
    decoration: InputDecoration(
      labelText: _label,
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior:FloatingLabelBehavior.always,
    ),
  );
}