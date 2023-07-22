import 'package:bb_characters/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget character_info(String tiltle, String value) {
  return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: tiltle,
          style:
              TextStyle(color: mycolors.mywhite, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: value,
          style: TextStyle(color: mycolors.mywhite, fontSize: 16),
        ),
      ]));
}

Widget build_divider(double value) {
  return Divider(
    thickness: 2,
    height: 30,
    endIndent: value,
    color: mycolors.myyellow,
  );
}
