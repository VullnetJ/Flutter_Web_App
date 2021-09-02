
 import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String label, String hint) {
    return InputDecoration(
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.blue
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color(0XFF69639f),
          width: 3,),
      ),
      labelText: label,
      hintText: hint,
      );
  }
  