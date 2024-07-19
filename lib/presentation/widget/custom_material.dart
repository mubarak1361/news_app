import 'package:flutter/material.dart';
import 'package:news_app/presentation/utils/app_colors.dart';

class CustomMaterial extends StatelessWidget {
  final Widget child;
  final bool enableElevation;

  const CustomMaterial(
      {Key? key,  required this.child, this.enableElevation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        elevation: enableElevation ? 1.0 : 0.0,
        shadowColor: enableElevation ? AppColors.midGrey.withAlpha(25) : null,
        child: child);
  }
}
