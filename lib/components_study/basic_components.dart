import 'package:flutter/material.dart';

class BasicComponents extends StatefulWidget {
  const BasicComponents({Key? key}) : super(key: key);

  @override
  State<BasicComponents> createState() => _BasicComponentsState();
}

class _BasicComponentsState extends State<BasicComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件学习'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ListView(
            children: [
              Text('我是Text组件-设置一行省略号展示 ' * 6,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const Text(
                '我是Text组件-设置当前字体大小的缩放因子',
                textScaleFactor: 1.3,
              ),
              const Text(
                '我是Text组件-设置对齐方式和字体大小及颜色及行高',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.blue, height: 1.5),
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(text: 'home: '),
                TextSpan(
                    text:
                        'https://book.flutterchina.club/chapter3/text.html#_3-1-3-textspan',
                    style: TextStyle(color: Colors.blue))
              ])),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    '按钮',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              const Image(
                image: AssetImage("images/pic_one.jpg"),
                // width: 100,
                height: 100,
              ),
              Image.asset(
                "images/pic_one.jpg",
                height: 100,
              ),
              const Image(
                image: NetworkImage(
                    "https://uploadfile.bizhizu.cn/up/ff/77/64/ff77643d4ed832bb118b53f2f01b875c.jpg"),
                height: 100,
              ),
              Image.network(
                "https://uploadfile.bizhizu.cn/up/ff/77/64/ff77643d4ed832bb118b53f2f01b875c.jpg",
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
