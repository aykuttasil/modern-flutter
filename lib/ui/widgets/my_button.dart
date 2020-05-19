import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  MyButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      key: key,
      child: Text(title),
      // color:  Theme.of(context).buttonColor,
      // textColor:Theme.of(context).accentColor,
      onPressed: onPressed,
    );
  }
}
