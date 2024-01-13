import 'package:apptuoicay/bluetooth/bluetooth_on_off.dart';
import 'package:apptuoicay/ui/scan_device_bt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<ScanResult> list_devcice = [];
  TextEditingController search_text = new TextEditingController();
  List<String> _searchResult = [];
  List<dynamic> ListID = [];
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {
      });
      return;
    }

    ListID.forEach((userDetail) {
      if (userDetail.contains(text) || userDetail.contains(text))
        _searchResult.add(userDetail);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Card(
            child:  ListTile(
              leading:  Icon(Icons.search),
              title:  TextField(
                controller: search_text,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onChanged: onSearchTextChanged,
              ),
              trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                search_text.clear();
                onSearchTextChanged('');
              },),
            ),
          ),
          Center(
            child: Text('Content of the screen'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Bluetooth bluetooth = await On_Off();
          Future.delayed(Duration(seconds: 5), () {
            // Sau khi chờ 5 giây, thực hiện công việc ở đây
            print("5 seconds have passed. Now executing the function.");
            print("Check: ${bluetooth.listResult}");
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ScanBT(list_devcice: bluetooth.listResult,)),);
          });
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
