import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredAnimationSeparatedListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final IndexedWidgetBuilder separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;

  const StaggeredAnimationSeparatedListView(
      {required this.itemBuilder,
      required this.itemCount,
      required this.separatorBuilder,
      this.padding,
      this.physics,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        itemBuilder: (buildContext, index) =>
            AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: itemBuilder(buildContext, index),
                  ),
                )),
        itemCount: itemCount,
        padding: padding,
        separatorBuilder: separatorBuilder,
        physics: physics,
      ),
    );
  }
}
