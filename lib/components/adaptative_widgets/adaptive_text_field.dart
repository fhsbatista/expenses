import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final Function(String) onSubmit;

  AdaptiveTextField({
    this.controller,
    this.hint,
    this.inputType,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Platform.isIOS
          ? CupertinoTextField(
              controller: controller,
              keyboardType: inputType,
              placeholder: hint,
              onSubmitted: onSubmit,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            )
          : TextFormField(
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                labelText: hint,
              ),
              onFieldSubmitted: onSubmit,
            ),
    );
  }
}
