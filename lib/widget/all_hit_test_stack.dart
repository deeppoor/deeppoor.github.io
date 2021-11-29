
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// AllHitTestStack 所有的 children 都将参与 hitTest
class AllHitTestStack extends Stack {
  @override
  AllHitTestRenderStack createRenderObject(BuildContext context) {
    return AllHitTestRenderStack(
      alignment: alignment,
      textDirection: textDirection ?? Directionality.maybeOf(context),
      fit: fit,
      clipBehavior: overflow == Overflow.visible ? Clip.none : clipBehavior,
    );
  }

  AllHitTestStack({
    Key? key,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children);
}

class AllHitTestRenderStack extends RenderStack {
  AllHitTestRenderStack({
    List<RenderBox>? children,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) : super(children: children, alignment: alignment, textDirection: textDirection, fit: fit, clipBehavior: clipBehavior);

  @override
  bool defaultHitTestChildren(BoxHitTestResult result, {required Offset position}) {
    RenderBox? child = lastChild;
    var count = 0;
    while (child != null) {
      final ContainerBoxParentData<RenderBox> childParentData = child.parentData! as ContainerBoxParentData<RenderBox>;
      final bool isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset? transformed) {
          assert(transformed == position - childParentData.offset);
          return child!.hitTest(result, position: transformed!);
        },
      );
      if (isHit) {
        count++;
      }
      child = childParentData.previousSibling;
    }

    if (count > 0) {
      return true;
    }
    return false;
  }
}