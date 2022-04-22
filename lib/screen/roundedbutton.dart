import 'package:flutter/material.dart';

import 'login_screen.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final Color colors;
  final Function func;
  RoundedButton(this.text,this.colors,this.func);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            func();

          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}