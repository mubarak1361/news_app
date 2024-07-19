import 'package:news_app/domain/model/result.dart';
import 'package:news_app/presentation/core/view_model.dart';
import 'package:news_app/presentation/core/view_state.dart';
import 'package:news_app/presentation/gen/assets.gen.dart';
import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:news_app/presentation/utils/app_text_style.dart';
import 'package:news_app/presentation/widget/bottom_slide_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultLayoutBuilder<V extends ViewModel, T> extends StatelessWidget {
  final Result<T>? Function(BuildContext, V) _selector;
  final Widget Function(T successData) _builder;
  final VoidCallback? _onRetry;

  const ResultLayoutBuilder(
      {required Result<T>? Function(BuildContext, V) selector,
      required Widget Function(T successData) builder,
      VoidCallback? onRetry,
      Key? key})
      : _selector = selector,
        _builder = builder,
        _onRetry = onRetry,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<V, Result<T>?>(
        selector: _selector,
        builder: (buildContext, result, __) =>
            result?.when(
                onSuccess: _builder,
                onFailure: (error) => Selector<V, ViewState>(
                      selector: (_, viewModel) => viewModel.state,
                      builder: (_, state, __) => Visibility(
                        visible: state == ViewState.idle,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.transparent,
                          child: BottomSlideInAnimation(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.svgs.common.botDead.svg(width: 150.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Text(error,
                                      style: getText16Regular(),
                                      textAlign: TextAlign.center),
                                ),
                                OutlinedButton(
                                  onPressed: _onRetry,
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(width: 1.2),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 24.0),
                                      textStyle: getText16Regular()),
                                  child: const Text('Try again'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )) ??
            Container(color: AppColors.primaryGrey));
  }
}
