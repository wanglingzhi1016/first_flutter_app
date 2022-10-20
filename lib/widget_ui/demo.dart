import 'package:first_flutter_app/widget_ui/button_group.dart';
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
              resetText: '查询1',
              confirmText: '确定1',
              onReset: () {
                print('点击查询按钮');
              },
              onConfirm: () {
                print('点击了确定按钮');
              })
        ],
      ),
    );
  }
}
