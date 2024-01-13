import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:apptuoicay/widgets/cardTimerWidget.dart';
import 'package:apptuoicay/widgets/dialogError.dart';
import 'package:apptuoicay/widgets/dialogInfo.dart';
import 'package:apptuoicay/widgets/dialogSuccess.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final database = FirebaseDatabase.instance.reference();
  Query dbQuery = FirebaseDatabase.instance
      .ref()
      .child('9BSuk4QD4wWQzppwltKPfI3w63i2/id0/timesetting_pump');
  String timeSelected =
      DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  TextEditingController timeController = TextEditingController();
  TextEditingController minutePumpController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  int selectedHour = 0;
  String time =
      DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  List<Map<dynamic, dynamic>> timeSettings = [];
  @override
  Widget build(BuildContext context) {
    timeSettings = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Timer'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbQuery,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map timeSetting = snapshot.value as Map;
            timeSettings.add(timeSetting);
            timeSetting['key'] = snapshot.key;

            return listItem(timeSetting: timeSetting);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // _addAlarm(context);
          hourController.text = "00";
          minuteController.text = "00";
          minutePumpController.text = "10";
          // timeController.text = time;
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Timer'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: minutePumpController,
                        decoration: InputDecoration(labelText: 'Minute Pump'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: humidityController,
                        decoration: InputDecoration(labelText: 'Humidity'),
                        keyboardType: TextInputType.number,
                      ),
                      Text('Timer alarm ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Hour : ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      CustomDropdown.search(
                        hintText: 'Select hour',
                        items: const [
                          "00",
                          "01",
                          "02",
                          "03",
                          "04",
                          "05",
                          "06",
                          "07",
                          "08",
                          "09",
                          "10",
                          "11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                          "23"
                        ],
                        controller: hourController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Minute : ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      CustomDropdown.search(
                        hintText: 'Select minute',
                        items: const [
                          "00",
                          "01",
                          "02",
                          "03",
                          "04",
                          "05",
                          "06",
                          "07",
                          "08",
                          "09",
                          "10",
                          "11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                          "23",
                          "24",
                          "25",
                          "26",
                          "27",
                          "28",
                          "29",
                          "30",
                          "31",
                          "32",
                          "33",
                          "34",
                          "35",
                          "36",
                          "37",
                          "38",
                          "39",
                          "40",
                          "41",
                          "42",
                          "43",
                          "44",
                          "45",
                          "46",
                          "47",
                          "48",
                          "49",
                          "50",
                          "51",
                          "52",
                          "53",
                          "54",
                          "55",
                          "56",
                          "57",
                          "58",
                          "59"
                        ],
                        controller: minuteController,
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Đóng dialog
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      try {
                        Navigator.of(context).pop();
                        int a = timeSettings.length;
                        if (a < 11) {
                          timeSettings.add({
                            'hour': int.parse(hourController.text),
                            'minute': int.parse(minuteController.text),
                            'humidity': humidityController.text == ''
                                ? -1
                                : int.parse(humidityController.text),
                            'minute_pump': minutePumpController.text == ''
                                ? -1
                                : int.parse(minutePumpController.text),
                            'status':1
                          });
                          timeSettings.sort((a, b) {
                            int hourComparison = a['hour'].compareTo(b['hour']);
                            if (hourComparison == 0) {
                              // If 'hour' is equal, compare 'value'
                              return a['minute'].compareTo(b['minute']);
                            }
                            return hourComparison;
                          });
                          for(int i=0;i<timeSettings.length;i++){
                            FirebaseDatabase.instance
                                .ref()
                                .child(
                                '9BSuk4QD4wWQzppwltKPfI3w63i2/id0/timesetting_pump/' +
                                    'time'+i.toString())
                                .update({
                              'hour': timeSettings[i]['hour'],
                              'minute':
                              timeSettings[i]['minute'],
                              'humidity': timeSettings[i]['humidity'],
                              'minute_pump': timeSettings[i]['minute_pump'],
                              'status':1
                            });
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(
                                message: "Change timer success",
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomInfoDialog(
                                  infoMessage:
                                      "Over the number of timers allowed");
                            },
                          );
                        }

                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomErrorDialog(
                              errorMessage: "Add timer failed",
                            );
                          },
                        );
                      }
                      // Lấy thông tin từ người dùng và xử lý
                       // Đóng dialog
                      print(timeSettings);
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Timer',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addAlarm(BuildContext context) async {
    TextEditingController minutePumpController = TextEditingController();
    TextEditingController humidityController = TextEditingController();

    minutePumpController.text = "10";
    int selectedHour = 0;
    String time =
        DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
    timeController.text = time;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Timer'),
          content: Column(
            children: [
              TextField(
                controller: minutePumpController,
                decoration: InputDecoration(labelText: 'Minute Pump'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: humidityController,
                decoration: InputDecoration(labelText: 'Humidity'),
                keyboardType: TextInputType.number,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Timer alarm ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timeController.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      ElevatedButton(
                        onPressed: () async {
                          var picker = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            helpText: "Set Alarm Time",
                          );
                          if (picker != null) {
                            setState(() {
                              timeSelected = picker.hour.toString() +
                                  ":" +
                                  picker.minute.toString();
                              timeController.text = time;
                            });
                          }
                        },
                        child: Icon(Icons.alarm_add),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lấy thông tin từ người dùng và xử lý
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget listItem({required Map timeSetting}) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 8,
              shadowColor: const Color(0xff2da9ef),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      if (timeSetting['minute_pump'] != -1) {
                        minutePumpController.text =
                            timeSetting['minute_pump'].toString();
                      }
                      if (timeSetting['humidity'] != -1) {
                        humidityController.text =
                            timeSetting['humidity'].toString();
                      }

                      if (timeSetting['hour'] < 10) {
                        hourController.text =
                            "0" + timeSetting['hour'].toString();
                      } else {
                        hourController.text = timeSetting['hour'].toString();
                      }
                      if (timeSetting['minute'] < 10) {
                        minuteController.text =
                            "0" + timeSetting['minute'].toString();
                      } else {
                        minuteController.text =
                            timeSetting['minute'].toString();
                      }
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Change Timer'),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: minutePumpController,
                                    decoration: InputDecoration(
                                        labelText: 'Minute Pump'),
                                    keyboardType: TextInputType.number,
                                  ),
                                  TextField(
                                    controller: humidityController,
                                    decoration:
                                        InputDecoration(labelText: 'Humidity'),
                                    keyboardType: TextInputType.number,
                                  ),
                                  Text('Timer alarm ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Hour : ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdown.search(
                                    hintText: 'Select hour',
                                    items: const [
                                      "00",
                                      "01",
                                      "02",
                                      "03",
                                      "04",
                                      "05",
                                      "06",
                                      "07",
                                      "08",
                                      "09",
                                      "10",
                                      "11",
                                      "12",
                                      "13",
                                      "14",
                                      "15",
                                      "16",
                                      "17",
                                      "18",
                                      "19",
                                      "20",
                                      "21",
                                      "22",
                                      "23"
                                    ],
                                    controller: hourController,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Minute : ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomDropdown.search(
                                    hintText: 'Select minute',
                                    items: const [
                                      "00",
                                      "01",
                                      "02",
                                      "03",
                                      "04",
                                      "05",
                                      "06",
                                      "07",
                                      "08",
                                      "09",
                                      "10",
                                      "11",
                                      "12",
                                      "13",
                                      "14",
                                      "15",
                                      "16",
                                      "17",
                                      "18",
                                      "19",
                                      "20",
                                      "21",
                                      "22",
                                      "23",
                                      "24",
                                      "25",
                                      "26",
                                      "27",
                                      "28",
                                      "29",
                                      "30",
                                      "31",
                                      "32",
                                      "33",
                                      "34",
                                      "35",
                                      "36",
                                      "37",
                                      "38",
                                      "39",
                                      "40",
                                      "41",
                                      "42",
                                      "43",
                                      "44",
                                      "45",
                                      "46",
                                      "47",
                                      "48",
                                      "49",
                                      "50",
                                      "51",
                                      "52",
                                      "53",
                                      "54",
                                      "55",
                                      "56",
                                      "57",
                                      "58",
                                      "59"
                                    ],
                                    controller: minuteController,
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Đóng dialog
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  try {
                                    Navigator.of(context).pop();
                                    FirebaseDatabase.instance
                                        .ref()
                                        .child(
                                            '9BSuk4QD4wWQzppwltKPfI3w63i2/id0/timesetting_pump/' +
                                                timeSetting['key'.toString()])
                                        .update({
                                      'hour': int.parse(hourController.text),
                                      'minute':
                                          int.parse(minuteController.text),
                                      'humidity': humidityController.text == ''
                                          ? -1
                                          : int.parse(humidityController.text),
                                      'minute_pump': minutePumpController
                                                  .text ==
                                              ''
                                          ? -1
                                          : int.parse(minutePumpController.text)
                                    });

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomAlertDialog(
                                          message: "Change timer success",
                                        );
                                      },
                                    );
                                  } catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomErrorDialog(
                                          errorMessage: "Change timer failed",
                                        );
                                      },
                                    );
                                    // DInfo.dialogError(context, 'Change timer failed');
                                    // DInfo.closeDialog(context,
                                    //     durationBeforeClose: const Duration(seconds: 2));
                                  }

                                  // Lấy thông tin từ người dùng và xử lý
                                  // Đóng dialog
                                },
                                child: Text('Change'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: ((timeSetting['hour'] < 10)
                                          ? "0" + timeSetting['hour'].toString()
                                          : timeSetting['hour'].toString())
                                      .toString() +
                                  ":" +
                                  ((timeSetting['minute'] < 10)
                                          ? "0" +
                                              timeSetting['minute'].toString()
                                          : timeSetting['minute'].toString())
                                      .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontSize: 30,
                                  )),
                        ),
                        Column(
                          children: [
                            (timeSetting['humidity'] != -1)
                                ? Text(
                                    'Humidity : ' +
                                        timeSetting['humidity'].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontSize: 15,
                                            height: 0,
                                            color: Colors.black54),
                                  )
                                : Text(
                                    'In ' +
                                        timeSetting['minute_pump'].toString() +
                                        ' minutes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontSize: 15,
                                            height: 0,
                                            color: Colors.black54),
                                  )
                          ],
                        ),
                        Switch(
                          value: timeSetting['status'] == 1 ? true : false,
                          hoverColor: Colors.white,
                          activeTrackColor: Colors.white,
                          thumbColor:
                              const MaterialStatePropertyAll(Colors.black45),
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.withOpacity(.5),
                          trackOutlineColor: const MaterialStatePropertyAll(
                            Colors.transparent,
                          ),
                          onChanged: (value) {
                            FirebaseDatabase.instance
                                .ref()
                                .child(
                                    '9BSuk4QD4wWQzppwltKPfI3w63i2/id0/timesetting_pump/' +
                                        timeSetting['key'.toString()])
                                .update({
                              'status': timeSetting['status'] == 1 ? 0 : 1
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
