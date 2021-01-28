import 'package:flutter/material.dart';
import './color.dart';

// ignore: deprecated_member_use
FlatButton dokanFlatBtn(String text, onPressed) {
  // ignore: deprecated_member_use
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: white,
    color: kPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

// ignore: deprecated_member_use
OutlineButton froyoOutlineBtn(String text, onPressed) {
  // ignore: deprecated_member_use
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: primaryColor,
    highlightedBorderColor: highlightColor,
    borderSide: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
