import 'package:flutter/material.dart';

class TapboxC extends StatefulWidget {
  const TapboxC({Key? key, this.active = false, required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(color: widget.active ? Colors.blue : Colors.yellow),
        child: Center(
          child: Text(
            widget.active ? 'Active3' : 'Inactive4',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
