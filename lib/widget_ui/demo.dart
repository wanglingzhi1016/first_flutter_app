import 'package:first_flutter_app/widget_ui/button_group.dart';
import 'package:first_flutter_app/widget_ui/bottomDrawer/header.dart';
import 'package:flutter/material.dart';

class WidgetUiDemo extends StatefulWidget {
  const WidgetUiDemo({Key? key}) : super(key: key);

  @override
  State<WidgetUiDemo> createState() => _WidgetUiDemoState();
}

class _WidgetUiDemoState extends State<WidgetUiDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件库Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ButtonGroup(
              resetText: '查询查询查询',
              confirmText: '确定',
              onReset: () {
                print('点击查询按钮');
              },
              onConfirm: () {
                print('点击了确定按钮');
              }),
          Container(
            height: 300,
            padding: const EdgeInsets.all(4),
            color: Colors.grey,
            child: ListView(
              children: [
                const DrawerTitle(),
                const Text(''),
                const DrawerTitle(title: '基础标题栏（一)'),
                const Text(''),
                const DrawerTitle(type: 2, title: '基础标题栏（二)'),
                const Text(''),
                DrawerTitle(
                  type: 3,
                  title: '基础标题栏（三）',
                  onCancel: () {
                    print('点击了取消按钮');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
