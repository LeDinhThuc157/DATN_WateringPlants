import 'package:flutter/material.dart';

class CustomInfoDialog extends StatelessWidget {
  final String infoMessage;

  CustomInfoDialog({required this.infoMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.info,
            color: Colors.blue,
            size: 60,
          ),
          SizedBox(height: 10),
          Text(
            infoMessage,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Đóng AlertDialog khi nhấn nút
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
