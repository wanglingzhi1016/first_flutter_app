import 'package:first_flutter_app/wedget_status_parentToChild/child_full.dart';
import 'package:first_flutter_app/wedget_status_parentToChild/child_less.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _activeB = false;
  bool _activeC = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _activeB = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TapboxB(
          active: _activeB,
          onChanged: (val) {
            setState(() {
              _activeB = val;
            });
          },
        ),
        TapboxC(
          active: _activeC,
          onChanged: (val) {
            setState(() {
              _activeC = val;
            });
          },
        )
      ],
    ));
  }
}
