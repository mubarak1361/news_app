import 'package:news_app/presentation/utils/app_font.dart';
import 'package:flutter/material.dart';

TextStyle getText20Regular() =>
    const TextStyle(fontSize: 20, fontWeight: AppFont.fontWeightRegular);

TextStyle getText20Bold() =>
    const TextStyle(fontSize: 20, fontWeight: AppFont.fontWeightBold);

TextStyle getText24Regular() =>
    const TextStyle(fontSize: 24, fontWeight: AppFont.fontWeightRegular);

TextStyle getText24Bold() =>
    const TextStyle(fontSize: 24, fontWeight: AppFont.fontWeightBold);

TextStyle getText46Bold() =>
    const TextStyle(fontSize: 46, fontWeight: AppFont.fontWeightBold);

TextStyle getText24Medium() =>
    const TextStyle(fontSize: 24, fontWeight: AppFont.fontWeightMedium);

TextStyle getText22Regular() =>
    const TextStyle(fontSize: 22, fontWeight: AppFont.fontWeightRegular);

TextStyle getText22Bold() =>
    const TextStyle(fontSize: 22, fontWeight: AppFont.fontWeightBold);

TextStyle getText18Regular() =>
    const TextStyle(fontSize: 18, fontWeight: AppFont.fontWeightRegular);

TextStyle getText18Bold() =>
    const TextStyle(fontSize: 18, fontWeight: AppFont.fontWeightBold);

TextStyle getText16Regular() =>
    const TextStyle(fontSize: 16, fontWeight: AppFont.fontWeightRegular);

TextStyle getText16Bold() =>
    const TextStyle(fontSize: 16, fontWeight: AppFont.fontWeightBold);

TextStyle getText14Regular() =>
    const TextStyle(fontSize: 14, fontWeight: AppFont.fontWeightRegular);

TextStyle getText14Bold() =>
    const TextStyle(fontSize: 14, fontWeight: AppFont.fontWeightBold);

TextStyle getText8Regular() =>
    const TextStyle(fontSize: 10, fontWeight: AppFont.fontWeightRegular);

TextStyle getText8Bold() =>
    const TextStyle(fontSize: 10, fontWeight: AppFont.fontWeightBold);

TextStyle getText12Regular() =>
    const TextStyle(fontSize: 12, fontWeight: AppFont.fontWeightRegular);

TextStyle getText12Bold() =>
    const TextStyle(fontSize: 12, fontWeight: AppFont.fontWeightBold);

TextStyle? getStyleSubHeading(context) =>
    Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black);

TextStyle? getStyleSubTitle(context) =>
    Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.black);

TextStyle? getStyleTitle(context) =>
    Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black);

TextStyle? getStyleHeading(context) =>
    Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black);

TextStyle? getStyleFirstHeading(context) =>
    Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black);
