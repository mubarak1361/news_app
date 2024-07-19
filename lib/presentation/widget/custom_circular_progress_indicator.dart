import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(14.0)),
      child: const CircularProgressIndicator(
        backgroundColor: AppColors.chevronGreyDisabled,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 2.0,
      ),
    );
  }
}
