import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  final String errorMessage;

  CustomErrorDialog({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 60,
          ),
          SizedBox(height: 10),
          Text(
            errorMessage,
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