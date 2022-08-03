import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Text(
                '${'我是抽屉内容' * 50}MediaQuery.removePadding可以移除Drawer默认的一些留白（比如Drawer默认顶部会留和手机状态栏等高的留白）'),
          )),
    );
  }
}
