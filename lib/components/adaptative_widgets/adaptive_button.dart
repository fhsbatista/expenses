import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AdaptiveButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10),
          )
        : RaisedButton(
            child: Text(text),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          );
  }
}
