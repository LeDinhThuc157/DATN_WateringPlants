import 'dart:ffi';

import 'package:apptuoicay/widgets/bottomSheetHeaderTitile.dart';
import 'package:apptuoicay/widgets/category_grid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference starCountRef =
      FirebaseDatabase.instance.ref('9BSuk4QD4wWQzppwltKPfI3w63i2/id0');
  final database =  FirebaseDatabase.instance
      .ref()
      .child(
      '9BSuk4QD4wWQzppwltKPfI3w63i2/id0');
  String status_pump = "";
  int current_himidity = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database.onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map pump = event.snapshot.value as Map;
        setState(() {
          // Cập nhật giá trị của status_pump từ cơ sở dữ liệu
          status_pump = pump["status_pump"];
          current_himidity = pump['humidity_current'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body:
      SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: 10,
                        //offset: Offset.infinite,
                      ),
                    ],
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        35.0,
                      ),
                      topRight: Radius.circular(
                        35.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetHeaderTitle(
                          titleText: 'Category',
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(10),
                            //crossAxisSpacing: 10,
                            //mainAxisSpacing: 10,
                            crossAxisCount: 4,
                            children: [
                              CategoryGrid(
                                category: 'Settings',
                                color: Colors.purple.shade500,
                                onTap: (){},
                              ),
                              CategoryGrid(
                                category: 'Timer',
                                color: Colors.blue.shade300,
                                onTap: (){},
                              ),
                              CategoryGrid(
                                category: 'History',
                                color: Colors.orange.shade500,
                                onTap: (){},
                              ),
                              CategoryGrid(
                                category: 'Other',
                                color: Colors.red.shade500,
                                onTap: (){},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const BottomSheetHeaderTitle(
                          titleText: 'Pump Status',
                        ),
                        Expanded(child: Container(
                          height: 50,
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
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("  Status : "+status_pump ),
                                          Switch(
                                            value: status_pump=='off'?false:true,
                                            hoverColor: Colors.white,
                                            activeTrackColor: Colors.white,
                                            thumbColor: const MaterialStatePropertyAll(
                                                Colors.black45),
                                            inactiveThumbColor: Colors.grey,
                                            inactiveTrackColor: Colors.grey.withOpacity(.5),
                                            trackOutlineColor: const MaterialStatePropertyAll(
                                              Colors.transparent,
                                            ),
                                            onChanged: (value) {

                                              database
                                                  .update({
                                                'status_pump': status_pump =="off"?"on":"off"
                                              });
                                              setState(() {
                                                status_pump = status_pump =="off"?"on":"off";
                                              });
                                            },
                                          )
                                        ],
                                      ),

                                    ],
                                  )),
                            ],
                          ),
                        ),),
                        Expanded(child: Container(
                          height: 30,
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
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("  Current Humidity : "+ current_himidity.toString()+"%" ),
                                          Image(
                                            image: AssetImage("assets/image/humidity.png"),
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),)

                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const BottomSheetHeaderTitle(
      //       titleText: 'Category',
      //     ),
      //     Expanded(
      //       child:  GridView.count(
      //         primary: false,
      //         padding: const EdgeInsets.all(40),
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //         crossAxisCount: 2,
      //         //how to use ListView.builder in this?
      //         children:[
      //           CategoryGrid(
      //             category: 'Settings',
      //             color: Colors.purple.shade500,
      //             onTap: () {},
      //           ),
      //           CategoryGrid(
      //             category: 'Timers',
      //             color: Colors.blue.shade300,
      //             onTap: () {},
      //           ),
      //           CategoryGrid(
      //             category: 'Logs',
      //             color: Colors.orange.shade500,
      //             onTap: () {},
      //           ),
      //           CategoryGrid(
      //             category: 'Other',
      //             color: Colors.red.shade500,
      //             onTap: () {},
      //           ),
      //           Column(
      //             children: [
      //               const BottomSheetHeaderTitle(
      //                 titleText: 'Pump Status',
      //               ),
      //               Container(
      //                 height: 100,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Card(
      //                         elevation: 8,
      //                         shadowColor: const Color(0xff2da9ef),
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(
      //                             10,
      //                           ),
      //                         ),
      //                         child: Column(
      //                           children: [
      //                             const SizedBox(
      //                               height: 20,
      //                             ),
      //                             Row(
      //                               crossAxisAlignment: CrossAxisAlignment.center,
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Text("Status : "+status_pump ),
      //                                 Switch(
      //                                   value: status_pump=='off'?false:true,
      //                                   hoverColor: Colors.white,
      //                                   activeTrackColor: Colors.white,
      //                                   thumbColor: const MaterialStatePropertyAll(
      //                                       Colors.black45),
      //                                   inactiveThumbColor: Colors.grey,
      //                                   inactiveTrackColor: Colors.grey.withOpacity(.5),
      //                                   trackOutlineColor: const MaterialStatePropertyAll(
      //                                     Colors.transparent,
      //                                   ),
      //                                   onChanged: (value) {
      //                                     // setState(() {
      //                                     //   status_pump=="off"?"on":"off";
      //                                     //   FirebaseDatabase.instance
      //                                     //       .ref()
      //                                     //       .child(
      //                                     //       '9BSuk4QD4wWQzppwltKPfI3w63i2/id0')
      //                                     //       .update({
      //                                     //     'status_pump': status_pump =="off"?"on":"off"
      //                                     //   });
      //                                     // });
      //
      //                                   },
      //                                 )
      //                               ],
      //                             ),
      //                             const SizedBox(
      //                               height: 20,
      //                             ),
      //                           ],
      //                         )),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //
      //     ),
      //     // const BottomSheetHeaderTitle(
      //     //   titleText: 'Pump Status',
      //     // ),
      //     Container(
      //       height: 100,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Card(
      //               elevation: 8,
      //               shadowColor: const Color(0xff2da9ef),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(
      //                   10,
      //                 ),
      //               ),
      //               child: Column(
      //                 children: [
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                      Text("Status : "+status_pump ),
      //                       Switch(
      //                         value: status_pump=='off'?false:true,
      //                         hoverColor: Colors.white,
      //                         activeTrackColor: Colors.white,
      //                         thumbColor: const MaterialStatePropertyAll(
      //                             Colors.black45),
      //                         inactiveThumbColor: Colors.grey,
      //                         inactiveTrackColor: Colors.grey.withOpacity(.5),
      //                         trackOutlineColor: const MaterialStatePropertyAll(
      //                           Colors.transparent,
      //                         ),
      //                         onChanged: (value) {
      //                           // setState(() {
      //                           //   status_pump=="off"?"on":"off";
      //                           //   FirebaseDatabase.instance
      //                           //       .ref()
      //                           //       .child(
      //                           //       '9BSuk4QD4wWQzppwltKPfI3w63i2/id0')
      //                           //       .update({
      //                           //     'status_pump': status_pump =="off"?"on":"off"
      //                           //   });
      //                           // });
      //
      //                         },
      //                       )
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                 ],
      //               )),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
