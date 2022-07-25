import 'package:first_flutter_app/home_page.dart';
import 'package:first_flutter_app/router_study/page_one.dart';
import 'package:flutter/material.dart';
import 'components_study/basic_components.dart';
import 'router_study/page_one_params.dart';
import 'router_study/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'page_one': (context) => const PageOne(
              text: '注册命名路由',
            ),
        'page_one_params': (context) {
          return PageOneParams(
              text: ModalRoute.of(context)!.settings.arguments.toString());
        },
        'page_two': (context) => const PageTwo(),
        'basic_components_study': (context) => const BasicComponents()
      },
      // TODO: 路由生成钩子未学习
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String routeName = settings.name;
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其它情况则正常打开路由。
      //   });
      // },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
