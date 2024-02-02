import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Setup_Wifi extends StatefulWidget {
  final BluetoothDevice? device;
  Setup_Wifi({super.key, this.device});

  @override
  State<Setup_Wifi> createState() => _Setup_WifiState();
}

class _Setup_WifiState extends State<Setup_Wifi> {
  TextEditingController wifi = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Future<void> service() async {
    List<BluetoothService> services = await  widget.device!.discoverServices();
    services.forEach((service) async {
      // do something with service
      var characteristics = service.characteristics;
      for(BluetoothCharacteristic c in characteristics) {
        if (c.properties.write) {
          String data_sent = "w:"+wifi.text+"\tp:"+password.text;
          List<int> bytes = utf8.encode(data_sent); // Chuyển đổi văn bản thành mảng byte
          await c.write(bytes);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConfigWifi"),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: wifi,
              decoration: new InputDecoration(
                  hintText: 'NameWifi',
                  border: InputBorder.none
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: password,
              decoration: new InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                service();
                AwesomeDialog(
                  context: context,
                  animType: AnimType.leftSlide,
                  headerAnimationLoop: false,
                  showCloseIcon: true,
                  title: 'Setup Thành Công!',
                  desc:
                  'Tên Wifi: ${wifi.text}\nPassword: ${password.text}',
                  btnOkOnPress: () {
                  },
                  btnOkIcon: Icons.check_circle,
                  onDismissCallback: (type) {
                  },
                ).show();
              },
              child: Text("Sent")
          )
        ],
      ),
    );
  }
}
