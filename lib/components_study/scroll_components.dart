import 'package:flutter/material.dart';

class ScrollComponents extends StatefulWidget {
  const ScrollComponents({Key? key}) : super(key: key);

  @override
  State<ScrollComponents> createState() => _ScrollComponentsState();
}

class _ScrollComponentsState extends State<ScrollComponents> {
  ScrollController _controller = ScrollController();
  bool showTopBtn = false; // 是否显示返回到底部的按钮

  @override
  void initState() {
    super.initState();
    // 监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      if (_controller.offset < 1000 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showTopBtn == false) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('可滚动组件学习'),
      ),
      // body: Scrollbar(
      //     child: SingleChildScrollView(
      //   padding: EdgeInsets.all(16),
      //   child: Center(
      //     child: Column(
      //       children: str
      //           .split('')
      //           .map((e) => Text(
      //                 e,
      //                 textScaleFactor: 2,
      //               ))
      //           .toList(),
      //     ),
      //   ),
      // )),
      // body: Column(
      //   children: [
      //     const ListTile(title: Text('商品列表')),
      //     // 自动拉伸除了头部位置其余的空间
      //     Expanded(
      //       child: ListView.builder(
      //           itemCount: 25,
      //           itemBuilder: (BuildContext context, int index) {
      //             return ListTile(
      //               title: Text("$index"),
      //             );
      //           }),
      //     )
      //   ],
      // ),
      // 滚动监听及控制
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, // 列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
      ),
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
