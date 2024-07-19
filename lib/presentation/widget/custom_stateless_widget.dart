import 'package:news_app/presentation/core/view_model.dart';
import 'package:news_app/presentation/gen/assets.gen.dart';
import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:news_app/presentation/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class CustomStatelessWidget<V extends ViewModel>
    extends StatelessWidget {
  const CustomStatelessWidget({Key? key}) : super(key: key);

  void onStart(BuildContext context, V viewModel);

  Widget? getHeaderView(BuildContext context) {
    return null;
  }

  Widget selector<D>({
    Key? key,
    required ValueWidgetBuilder<D> builder,
    required D Function(BuildContext, V) selector,
    ShouldRebuild<D>? shouldRebuild,
    Widget? child,
  }) =>
      Selector(builder: builder, selector: selector);

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Row(
            children: [
          Assets.svgs.common.botInDanger.svg(width: 40.0, height: 40.0),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: getText14Regular().copyWith(color: AppColors.primaryBlack),
            ),
          )
        ]),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating);

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar(
        reason: SnackBarClosedReason.dismiss,
      )
      ..showSnackBar(snackBar);
  }
}
