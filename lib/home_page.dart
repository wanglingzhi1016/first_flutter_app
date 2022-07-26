import 'package:first_flutter_app/wedget_status_parentToChild/parent.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/data_type.dart';
import 'package:first_flutter_app/router_study/page_one.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(fontSize: 24, color: Colors.green),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DataType(),
            ParentWidget(),
            TextButton(
              onPressed: () {
                // 导航到page_one路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PageOne(
                    text: '我是上一个路由传过来的值, 跳转page_one',
                  );
                }));
              },
              child: const Text("点击跳转到page_one页面(非命名路由跳转方式)"),
            ),
            TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, 'page_one');
                  Navigator.of(context).pushNamed('page_one_params',
                      arguments: '我是上一个路由传过来的值，通过命名参数传值');
                },
                child: const Text("点击跳转到page_one_params页面（通过命名路由跳转）")),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'page_two');
              },
              child: const Text(
                "点击跳转到page_two页面（通过命名路由跳转）",
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'basic_components_study');
                },
                child: const Text('基础组件学习'))
          ],
        ),
      ),
    );
  }
}
