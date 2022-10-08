import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_syntop/models/merk_model.dart';
import 'package:flutter_syntop/themes/theme.dart';

class SeeAllChip extends StatelessWidget {
  final MerkModel merk;
  final Color colorChip;
  final Icon iconChip;

  const SeeAllChip({
    super.key,
    required this.merk,
    required this.colorChip,
    required this.iconChip,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        merk.merkProduct,
        style: whiteTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      avatar: CircleAvatar(
        child: iconChip,
        backgroundColor: bgSplashScreen,
      ),
      labelPadding: EdgeInsets.all(5.0),
      elevation: 1.0,
      shadowColor: Colors.grey[60],
      backgroundColor: colorChip,
      padding: EdgeInsets.all(7.0),
    );
  }
}
