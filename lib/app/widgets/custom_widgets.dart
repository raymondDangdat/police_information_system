import 'package:flutter/material.dart';
Widget customButton(BuildContext context, String title, Function onTap) {
  return Container(
    height: 42.0,
    child: RaisedButton(
      onPressed: onTap as void Function(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(9.0)),
        child: Container(
          // constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 19.2),
          ),
        ),
      ),
    ),
  );
}