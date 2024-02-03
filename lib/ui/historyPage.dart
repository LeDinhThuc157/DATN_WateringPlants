import 'package:apptuoicay/widgets/cardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final database = FirebaseDatabase.instance.reference();
  Query dbQuery = FirebaseDatabase.instance.ref().child('9BSuk4QD4wWQzppwltKPfI3w63i2/id0/history');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('History'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbQuery,
          sort: (a,b){
            Map av = a.value as Map;
            Map bv = b.value as Map;
            int yearComparison = bv['year'].compareTo(av['year']);
            if (yearComparison != 0) {
              return yearComparison;
            }
            int monthComparison = bv['month'].compareTo(av['month']);
            if (monthComparison != 0) {
              return monthComparison;
            }
            int dayComparison = bv['day'].compareTo(av['day']);
            if (dayComparison != 0) {
              return dayComparison;
            }
            int hourComparison = bv['hour'].compareTo(av['hour']);
            if (hourComparison != 0) {
              return hourComparison;
            }
            return bv['minute'].compareTo(av['minute']);
          },
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

            Map history = snapshot.value as Map;
            history['key'] = snapshot.key;

            return listItem(history: history);

          },
        ),
      ),
    );
  }
  Widget listItem({required Map history}) {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardWidgets(history: history),
          // Text(
          //   history['day'].toString(),
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   history['hour'].toString(),
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   history['month'].toString(),
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }
}
