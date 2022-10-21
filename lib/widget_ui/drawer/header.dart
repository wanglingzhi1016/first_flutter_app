import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle(
      {Key? key,
      this.type = 1,
      this.title = '',
      this.cancelText = '取消',
      this.confirmText = '确定',
      this.onClose,
      this.onBack,
      this.onCancel,
      this.onConfirm})
      : super(key: key);

  final int type; // 标题类型：1只展示右边关闭按钮；2只展示左边返回按钮；3展示左边取消按钮以及右边确定按钮
  final String title;
  final VoidCallback? onClose;
  final VoidCallback? onBack;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: type != 3 ? 48 : 52,
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getChildList(),
        ),
      ),
    );
  }

  _getChildList() {
    List<Widget> _children;
    // 左右两边操作按钮的大小
    const double _fontSize = 16;
    // 左右按钮缺失时的占位符
    const Widget _emptyChild = SizedBox(
      width: 48,
      child: Text(''),
    );

    switch (type) {
      case 1:
        _children = [
          _emptyChild,
          IconButton(
              onPressed: onClose,
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.centerRight,
              icon: const Icon(
                Icons.close,
                color: Color(0xff333333),
                size: _fontSize,
              )),
        ];
        break;
      case 2:
        _children = [
          IconButton(
              onPressed: onBack,
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff999999),
                size: _fontSize,
              )),
          _emptyChild,
        ];
        break;
      default:
        _children = [
          TextButton(
              onPressed: onCancel,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.centerLeft),
              child: Text(
                cancelText,
                style: const TextStyle(
                    fontSize: _fontSize, color: Color(0xff666666)),
              )),
          TextButton(
              onPressed: onConfirm,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.centerRight),
              child: Text(
                confirmText,
                style: const TextStyle(
                    fontSize: _fontSize,
                    color: Color(0xff006EFE),
                    fontWeight: FontWeight.w500),
              )),
        ];
        break;
    }

    _children.insert(
        1,
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff262626)),
        ));

    return _children;
  }
}
