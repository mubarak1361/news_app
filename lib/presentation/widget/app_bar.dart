import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:news_app/presentation/utils/app_text_style.dart';
import 'package:flutter/material.dart';

appBar(
    {required BuildContext context,
    required String title,
    bool? enableBackAction,
    bool centerTitle = true}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.white,
    centerTitle: centerTitle,
    leading: enableBackAction != null
        ? GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.primaryBlack,
                size: 25,
              ),
            ),
          )
        : null,
    title: Text(
      title,
      style: getText18Bold().copyWith(color: AppColors.primaryBlack),
    ),
  );
}
