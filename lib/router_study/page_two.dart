// 命名路由跳转及传值

import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我是page_two页面')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text("我是page_two页面，没有路由参数传值"),
      ),
    );
  }
}
