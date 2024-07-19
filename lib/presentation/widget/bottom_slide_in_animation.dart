import 'dart:async';
import 'package:flutter/material.dart';

class BottomSlideInAnimation extends StatefulWidget {
  final Widget child;
  final int? delay;

  const BottomSlideInAnimation({Key? key, required this.child, this.delay})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomSlideInAnimationState();
}

class _BottomSlideInAnimationState extends State<BottomSlideInAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.50), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay!), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
