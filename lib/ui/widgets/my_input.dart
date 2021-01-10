import 'package:flutter/material.dart';
import 'package:modern_flutter/utils/ui_helper.dart';

class MyInput extends StatelessWidget {
  const MyInput(this.hintText, this.isObscure, this.onChanged);

  final bool isObscure;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: UIHelper.WHITE),
      textAlign: TextAlign.left,
      obscureText: isObscure,
      autocorrect: false,
      cursorColor: UIHelper.WHITE,
      maxLines: 1,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      onChanged: onChanged,
    );
  }
}
