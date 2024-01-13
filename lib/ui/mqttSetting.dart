import 'package:apptuoicay/mqtt/mqtt_client.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // MqttServerClient client =
  // MqttServerClient.withPort('mqtt://white-dev.aithings.vn', 'device_test', 1883);
  bool isTurnOn = false;
  MqttServerClient client = MqttServerClient('white-dev.aithings.vn',"");
  MqttClient? mqttClient = null;
  @override
  void dispose() {
    super.dispose();
    mqttClient?.client?.disconnect();
  }

  Future<void> turnon_off(bool value) async {
    mqttClient = await MqttClient(client);
    setState(() {
      isTurnOn = value;
      if(isTurnOn == true) mqttClient?.Publish("turn_on");
      else mqttClient?.Publish("turn_off");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Center(
                child: SwitchListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.heat_pump),
                        SizedBox(
                          width: 35,
                        ),
                        Text('Charge'),
                      ],
                    ),
                    activeColor: Colors.teal,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.blueGrey,
                    value: isTurnOn,
                    onChanged: (bool value) {
                      turnon_off(value);
                    }
                )
            ),
          ),
        ],
      )

    );
  }
}
