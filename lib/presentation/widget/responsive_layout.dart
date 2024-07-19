import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget _child;
  static const double _preferredWidth = 500.0;

  const ResponsiveLayout({Key? key, required Widget child})
      : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (buildContext, constraints) => SizedBox(
          width: constraints.maxWidth > _preferredWidth
              ? _preferredWidth
              : constraints.maxWidth,
          child: _child,
        ));
  }
}
