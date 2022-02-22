import 'package:flutter/material.dart';

TextFormField FormText(_controller, _label, {read = false}) {
  return TextFormField(
    controller: _controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Este campo não pode estar em branco';
      }
      return null;
    },
    readOnly: read,
    scrollPadding: EdgeInsets.zero,
    decoration: InputDecoration(
      labelText: _label,
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior:FloatingLabelBehavior.always,
    ),
  );
}