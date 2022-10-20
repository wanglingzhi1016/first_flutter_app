import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget {
  const ButtonGroup(
      {Key? key,
      this.resetText = '重置',
      this.confirmText = '确定',
      required this.onReset,
      required this.onConfirm})
      : super(key: key);

  final String resetText;
  final String confirmText;
  final VoidCallback onReset;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(142, 44)),
              side: MaterialStateProperty.all(
                  const BorderSide(width: 1, color: Color(0xFFBFBFBF))),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))))),
          onPressed: onReset,
          child: Text(
            resetText,
            style: const TextStyle(fontSize: 16, color: Color(0xFF262626)),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF006EFE)),
                fixedSize: MaterialStateProperty.all(const Size(142, 44)),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))))),
            onPressed: onConfirm,
            child: Text(
              confirmText,
              style: const TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}
