import 'package:flutter/material.dart';

class TapboxB extends StatelessWidget {
  const TapboxB({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(color: active ? Colors.lightGreen : Colors.grey),
        child: Center(
          child: Text(
            active ? 'Active1' : 'Inactive1',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _handleTap() {
    onChanged(!active);
  }
}
