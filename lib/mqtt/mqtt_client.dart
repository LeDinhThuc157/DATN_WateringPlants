import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttClient{
  MqttServerClient? client;
  MqttClient(this.client);
  Future<void> Publish(String data) async {
    // client?.port = 1883;
    // client?.useWebSocket = true;
    client?.logging(on: false);

    // Đăng nhập với tên người dùng và mật khẩu
    client?.setProtocolV311();

    /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
    client?.keepAlivePeriod = 20;

    /// The connection timeout period can be set if needed, the default is 5 seconds.
    client?.connectTimeoutPeriod = 2000; // milliseconds
    final connMess = MqttConnectMessage()
        .withClientIdentifier('')
        .withWillTopic('device_test/control') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    client?.connectionMessage = connMess;
    try {
      print('Conecting....');
      await client?.connect();
    } catch (e) {
      print('Exception: $e');
      client?.disconnect();
    }
    const pubTopic = 'device_test/control';
    final builder = MqttClientPayloadBuilder();
    builder.addString(data);
    client?.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
    client?.disconnect();
    print('Disconnect! Sent to complete....');
  }
}

