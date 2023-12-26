import 'package:apptuoicay/bluetooth/bluetooth_on_off.dart';
import 'package:apptuoicay/ui/setup_wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanBT extends StatefulWidget {
  final List<ScanResult>? list_devcice;

  ScanBT({super.key, required this.list_devcice});

  @override
  State<ScanBT> createState() => _ScanBTState();
}

class _ScanBTState extends State<ScanBT> {
  @override
  void initState() {
    super.initState();
    print(widget.list_devcice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.list_devcice?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TextButton(
                    onPressed: () {
                      connectToDevice(widget.list_devcice![index].device);
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Setup_Wifi(device: widget.list_devcice![index].device,)),);
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.bluetooth),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                  "${widget.list_devcice?[index].device.name}"),
                            ),
                            Container(
                              child: Text(
                                  "${widget.list_devcice?[index].device.id}"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            }),
      ),
    );
  }
}
