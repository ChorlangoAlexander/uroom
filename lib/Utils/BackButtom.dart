import 'package:flutter/material.dart';

Widget backButton(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

Widget backButton2(
  BuildContext context,
) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
