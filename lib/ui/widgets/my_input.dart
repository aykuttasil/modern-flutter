import 'package:flutter/material.dart';
import 'package:modern_flutter/utils/ui_helper.dart';

class MyInput extends StatelessWidget {
  final bool isObscure;
  final String hintText;
  final ValueChanged<String> onChanged;

  MyInput(this.hintText, this.isObscure, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: UIHelper.WHITE),
      textAlign: TextAlign.left,
      obscureText: isObscure,
      autocorrect: false,
      cursorColor: UIHelper.WHITE,
      maxLines: 1,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
      onChanged: onChanged,
    );
  }
}
