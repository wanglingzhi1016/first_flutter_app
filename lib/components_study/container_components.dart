/* 容器类Widget和布局类Widget都作用于其子Widget，不同的是：
  1、布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；而容器类Widget一般只需要接收
  一个子Widget（child）， 他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。
  2、布局类Widget是按照一定的排列方式来对其子Widget进行排列；而容器类Widget一般只是包装其子Widget，对其添加一些修饰（补白或背景色等）、变换(旋转或剪裁等)、或限制(大小等)。
  参考文档：https://book.flutterchina.club/chapter5/
*/

import 'package:first_flutter_app/components_study/container_drawer.dart';
import 'package:flutter/material.dart';

class ContainerComponentStudy extends StatefulWidget {
  const ContainerComponentStudy({Key? key}) : super(key: key);

  @override
  State<ContainerComponentStudy> createState() =>
      _ContainerComponentStudyState();
}

class _ContainerComponentStudyState extends State<ContainerComponentStudy> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      'images/pic_one.jpg',
      height: 60,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局类组件学习'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.share))
        ],
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: Icon(Icons.dashboard),
        //       color: Colors.white,
        //     );
        //   },
        // ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Business')
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('我是padding容器组件-填充'),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red, // 会被gradient覆盖
              // image,
              border: Border.all(color: Colors.blue, width: 4),
              // border: const Border(
              //     left: BorderSide(color: Colors.green, width: 10),
              //     right: BorderSide(color: Colors.green, width: 10),
              //     top: BorderSide(color: Colors.red, width: 10),
              //     bottom: BorderSide(color: Colors.red, width: 10)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
              gradient:
                  LinearGradient(colors: [Colors.red, Colors.orange.shade700]),
            ),
            child: const Text(
                'DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等'),
          ),
          Transform(
            alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
            transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child: const Text('Apartment for rent!'),
            ),
          ),
          Container(
            child: Text('我是Container组件'),
            color: Colors.yellow,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
          ),
          avatar,
          ClipOval(child: avatar), // TODO: 为什么无效
          wContainer(BoxFit.none),
          wContainer(BoxFit.contain),
          const Text(
              '因为父Container要比子Container 小，所以当没有指定任何适配方式时，子组件会按照其真实大小进行绘制，所以第一个蓝色区域会超出父组件的空间。第二个我们指定了适配方式为 BoxFit.contain，含义是按照子组件的比例缩放，尽可能多的占据父组件空间，因为子组件的长宽并不相同，所以按照比例缩放适配父组件后，父组件能显示一部分。'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      // 指定floatingActionButton在页面中悬浮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(10),
        color: Colors.red,
        child: FittedBox(
            fit: boxFit,
            // 子容器超过父容器大小
            child: Container(
              width: 60,
              height: 70,
              color: Colors.blue,
              child: const Text('FittedBox'),
            )));
  }
}
