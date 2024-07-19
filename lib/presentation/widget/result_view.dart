import 'package:news_app/presentation/core/result_view_model.dart';
import 'package:news_app/presentation/widget/custom_stateless_widget.dart';
import 'package:news_app/presentation/widget/result_layout_builder.dart';
import 'package:news_app/presentation/widget/view_builder.dart';
import 'package:flutter/material.dart';

abstract class ResultView<V extends ResultViewModel<T>, T>
    extends CustomStatelessWidget<V> {

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Widget onBuild(BuildContext context, V viewModel, T result);

  void onRefresh(BuildContext context, V viewModel) {}

  ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomViewBuilder<V>(
        onModelReady: (viewModel) {
          viewModel.failureMessage = (message) {
            showSnackBar(context, message);
          };
          onStart(context, viewModel);
        },
        header: getHeaderView(context),
        builder: (buildContext, viewModel) => ResultLayoutBuilder<V, T>(
            selector: (_, viewModel) => viewModel.result,
            onRetry: () => onRefresh(buildContext, viewModel),
            builder: (result) => RefreshIndicator(
                key: _refreshIndicatorKey,
                notificationPredicate: (_) => viewModel.enableSwipeRefresh(),
                onRefresh: () async => onRefresh(buildContext, viewModel),
                child: onBuild(buildContext, viewModel, result))));
  }
}
