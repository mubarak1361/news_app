import 'package:news_app/core/di/di_configuration.dart';
import 'package:news_app/presentation/core/view_model.dart';
import 'package:news_app/presentation/core/view_state.dart';
import 'package:news_app/presentation/widget/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomViewBuilder<T extends ViewModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T t) _builder;
  final Function(T)? _onModelReady;
  final Widget? _header;

  const CustomViewBuilder(
      {required Widget Function(BuildContext context, T t) builder,
      Function(T)? onModelReady,
      Widget? header,
      Key? key})
      : _builder = builder,
        _onModelReady = onModelReady,
        _header = header,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        final model = locator<T>();
        if (_onModelReady != null) {
          _onModelReady!(model);
        }
        return model;
      },
      builder: (buildContext, child) => Column(
        children: [
          child ?? const SizedBox(),
          Expanded(
            child: Stack(children: [
              _builder(buildContext, buildContext.read()),
              _loadBusyWidget(child: const ModalBarrier(dismissible: false)),
              _loadBusyWidget(
                  child: const Center(child: CustomCircularProgressIndicator()))
            ]),
          ),
        ],
      ),
      child: _header,
    );
  }

  Widget _loadBusyWidget({required Widget child}) {
    return Selector<T, ViewState>(
      selector: (_, viewModel) => viewModel.state,
      builder: (_, viewState, __) => Visibility(
        visible: viewState == ViewState.busy,
        child: child,
      ),
    );
  }
}
