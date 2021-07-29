import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String label, String hint) {
  return InputDecoration(
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: Colors.blue
        )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
            color: Color(0XFF69639F)
        )
    ),
    labelText: label,
    hintText: hint,
  );
}