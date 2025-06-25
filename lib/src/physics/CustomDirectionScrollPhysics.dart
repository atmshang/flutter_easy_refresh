import 'package:flutter/material.dart';

class CustomDirectionScrollPhysics extends AlwaysScrollableScrollPhysics {
  final Axis? axis; // 滚动方向限制，可为 null（不限制）

  const CustomDirectionScrollPhysics({this.axis, super.parent});

  @override
  CustomDirectionScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomDirectionScrollPhysics(
        axis: axis, parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    // 如果未指定限制方向（axis == null），允许所有方向滚动
    if (axis == null) return true;

    // 如果传入了 axis，则仅允许特定方向滚动
    return position.axis == axis;
  }
}
