// 基本路由传值和跳转

import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page_one_title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
