// 布局类组件学习
import 'package:first_flutter_app/components_study/layoutBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayoutComponents extends StatefulWidget {
  const LayoutComponents({Key? key}) : super(key: key);

  @override
  State<LayoutComponents> createState() => _LayoutComponentsState();
}

class _LayoutComponentsState extends State<LayoutComponents> {
  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text('阿克苏搭街坊卡森积分卡'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('布局类组件学习'),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: double.infinity, minHeight: 50.0),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: redBox,
          ),
          Column(
            // 测试Row对其方式，排除column默认居中对其的干扰
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('hello word'), Text(' I am Column')],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: const [
                  Text(
                    'hello work',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text('I am Row')
                ],
              )
            ],
          ),
          // Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 100,
                // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 30,
                          color: Colors.red,
                        )),
                    Spacer(flex: 1),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          color: Colors.green,
                        ))
                  ],
                ),
              )),
          Wrap(
            spacing: 26, // 主轴(水平)方向间距
            runSpacing: 0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, // 沿主轴方向居中
            children: const [
              Chip(
                label: Text('哈哈'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('H'),
                ),
              ),
              Chip(
                label: Text('滴滴'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('D'),
                ),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('H')),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('J')),
                label: Text('Laurens'),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
              const Positioned(
                left: 18,
                child: Text('左18'),
              ),
              const Positioned(
                top: 4,
                child: Text('上18'),
              ),
            ],
          ),
          SizedBox(
            // width: 220,
            child: ResponsiveColumn(children: _children),
          ),
        ],
      ),
    );
  }

  // TODO: 单独抽出来后，为什么没有热更新
  Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
    child: Text('ConstrainedBox、SizedBox'),
  );
}
