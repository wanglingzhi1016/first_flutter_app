import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  // const DataType({Key? key}) : super(key: key);

  @override
  State<DataType> createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    return Container(
      child: const Text(
        '常用数据类型，请查看控制台输出',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  //  数字类型
  void _numType() {
    num num1 = -1.0;
    print("num: $num1");
  }
}
