import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllChip extends StatelessWidget {
  final String text;
  final Color colorChip;
  final Icon iconChip;

  const SeeAllChip({
    required this.text,
    required this.colorChip,
    required this.iconChip,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      avatar: CircleAvatar(
        child: iconChip,
      ),
      labelPadding: EdgeInsets.all(5.0),
      elevation: 1.0,
      shadowColor: Colors.grey[60],
      backgroundColor: colorChip,
      padding: EdgeInsets.all(7.0),
    );
  }
}
