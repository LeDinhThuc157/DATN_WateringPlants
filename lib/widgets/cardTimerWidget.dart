import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardAlarmWidget extends StatelessWidget {
  final Map timeSetting;
  const CardAlarmWidget({Key? key, required this.timeSetting})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shadowColor: const Color(0xff2da9ef),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: ((timeSetting['hour'].toString() != '0')
                              ? timeSetting['hour']
                              : "00")
                              .toString() +
                              ":" +
                              ((timeSetting['minute'].toString() != '0')
                                  ? timeSetting['minute']
                                  : "00")
                                  .toString(),
                          style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.black54,
                            fontSize: 30,
                          )),
                  ),
                  Column(
                    children: [
                      Text(
                        'Alarm 1',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 15, height: 0, color: Colors.black54),
                      ),
                      // Text(
                      //   '${snapshot.data![index].day}',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .headlineSmall!
                      //       .copyWith(
                      //       fontSize: 10,
                      //       height: 0,
                      //       color: Colors.black54),
                      // )
                    ],
                  ),
                  Switch(
                    value: timeSetting['status'] == 1 ? true : false,
                    hoverColor: Colors.white,
                    activeTrackColor: Colors.white,
                    thumbColor:
                        const MaterialStatePropertyAll(Colors.black45),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey.withOpacity(.1),
                    trackOutlineColor: const MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    onChanged: (value) {

                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
