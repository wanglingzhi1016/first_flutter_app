import 'package:flutter/material.dart';

// 通过 LayoutBuilder，我们可以在布局过程中拿到父组件传递的约束信息，然后我们可以根据约束信息动态的构建不同的布局。
// 比如我们实现一个响应式的 Column 组件 ResponsiveColumn，它的功能是当当前可用的宽度小于 200 时，将子组件显示为一列，否则显示为两列。简单来实现一下：
class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 200) {
        // 最大宽度小于200，显示单列
        return Column(children: children, mainAxisSize: MainAxisSize.min);
      } else {
        // 大于200，显示双列
        var _children = <Widget>[];
        for (var i = 0; i < children.length; i += 2) {
          if (i + 1 < children.length) {
            _children.add(Row(
              children: [children[i], children[i + 1]],
              mainAxisSize: MainAxisSize.min,
            ));
          } else {
            _children.add(children[i]);
          }
        }
        return Column(children: _children, mainAxisSize: MainAxisSize.min);
      }
    });
  }
}
