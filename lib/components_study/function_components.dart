import 'package:flutter/material.dart';

class FunComponents extends StatefulWidget {
  const FunComponents({Key? key}) : super(key: key);

  @override
  State<FunComponents> createState() => _FunComponentsState();
}

class _FunComponentsState extends State<FunComponents> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('功能性组件学习'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () async {
                bool? delete = await _showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除：$delete");
                } else {
                  print("已确认删除子目录：$delete");
                  //... 删除文件
                }
              },
              child: const Text('点击打开对话框AlertDialog')),
          ElevatedButton(
              onPressed: () async {
                await _changeLanguage();
              },
              child: const Text('点击打开对话框SimpleDialog')),
          ElevatedButton(
              onPressed: () async => await _showListDialog(),
              child: const Text('点击打开对话框Dialog')),
          ElevatedButton(
              onPressed: () async {
                int? type = await _showModalBottomSheet();
                print(type);
              },
              child: const Text('点击打开底部菜单列表showModalBottomSheet')),
          ElevatedButton(
              onPressed: () async {
                _showLoadingDialog();
              },
              child: const Text('点击打开Loading框')),
          ElevatedButton(
              onPressed: () async {
                _showDatePicker();
              },
              child: const Text('点击打开日历选择器'))
        ],
      ),
    );
  }

  Future<bool?> _showDeleteConfirmDialog1() {
    withTree = false;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('您确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    const Text('您确定要删除当前文件吗?'),
                    // 方法一：StatefulBuilder沿用子组件context，以此更新checkbox的视图
                    // StatefulBuilder(builder: (context, setState) {
                    //   return Checkbox(
                    //     value: withTree,
                    //     onChanged: (bool? value) {
                    //       setState(() {
                    //         withTree = !withTree;
                    //       });
                    //     },
                    //   );
                    // })
                    // 方法二：将Checkbox的Element标记为dirty，以此利用setState的原理来更新checkbox的视图
                    Builder(builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    })
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('取消')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(withTree);
                  },
                  child: const Text('删除'))
            ],
          );
        });
  }

  Future<void> _changeLanguage() async {
    int? i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('美国英语'),
                ),
              )
            ],
          );
        });
    if (i != null) {
      print('选择了：${i == 1 ? '中文简体' : '美国英语'}');
    }
  }

  Future<void> _showListDialog() async {
    int? index = await showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: [
              const ListTile(
                title: Text('请选择'),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('$index'),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );
          return Dialog(
            child: child,
          );
          // 等同于return Dialog效果，这块内容可以完全自定义
          // return UnconstrainedBox(
          //   constrainedAxis: Axis.vertical,
          //   child: ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 280),
          //     child: Material(
          //       child: child,
          //       type: MaterialType.card,
          //     ),
          //   ),
          // );
        });
    if (index != null) {
      print('点击了：$index');
    }
  }

  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('$index'),
                  onTap: () => Navigator.of(context).pop(index),
                );
              });
        });
  }

  Future _showLoadingDialog() {
    return showDialog(
        context: context,
        // barrierDismissible: false, // 点击遮罩不关闭对话框
        builder: (BuildContext context) {
          // return AlertDialog(
          //   content: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: const [
          //       CircularProgressIndicator(),
          //       Padding(
          //         padding: EdgeInsets.only(top: 26),
          //         child: Text('正在加载中，请稍后...'),
          //       )
          //     ],
          //   ),
          // );
          // 如果我们嫌Loading框太宽，想自定义对话框宽度,我们可以使用UnconstrainedBox先抵消showDialog对宽度的约束，然后再使用SizedBox指定宽度
          return UnconstrainedBox(
            // constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 300,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 26),
                      child: Text('正在加载中，请稍后...'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<DateTime?> _showDatePicker() {
    var date = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.add(Duration(days: -1)),
        lastDate: date.add(Duration(days: 1)));
  }
}
