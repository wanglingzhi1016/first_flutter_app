// 基础组件学习

import 'package:flutter/material.dart';

class BasicComponents extends StatefulWidget {
  const BasicComponents({Key? key}) : super(key: key);

  @override
  State<BasicComponents> createState() => _BasicComponentsState();
}

class _BasicComponentsState extends State<BasicComponents> {
  bool _switchSelected = true; // 维护单选开关状态
  bool _checkboxSelected = true; // 维护复选框状态

  final TextEditingController _unameController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

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
              ),
              const Icon(
                Icons.error,
                color: Colors.green,
              ),
              //TODO:如何加上选中和未选中文字显示
              Switch(
                  value: _switchSelected,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  }),
              Checkbox(
                  value: _checkboxSelected,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value!;
                    });
                  }),
              //获取输入内容有两种方式：
              // 1、定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。
              // 2、通过controller直接获取。
              // 参考文档：https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield
              const TextField(
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    prefixIcon: Icon(Icons.person)),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _unameController,
                        decoration: const InputDecoration(
                            labelText: '用户名',
                            hintText: '请输入用户名',
                            icon: Icon(Icons.person)),
                        validator: (v) {
                          return v!.trim().isNotEmpty ? null : '用户名不能为空';
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //  验证通过提交数据
                            }
                          },
                          child: Text('登录'))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
