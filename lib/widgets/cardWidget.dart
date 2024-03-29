import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidgets extends StatelessWidget {
  final Map history;
  const CardWidgets({
    Key? key,
    required this.history,
  }):super(key: key);

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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            ((history['day'] <10) ? "0"+history['day'].toString():history['day'].toString())
                +"/"+((history['month'] <10) ? "0"+history['month'].toString():history['month'].toString())
                +"/"+history['year'].toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          "Time " + ((history['hour'] <10) ? "0"+history['hour'].toString():history['hour'].toString()) +":"+((history['minute'] < 10 ) ? "0"+history['minute'].toString():history['minute'].toString()),
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 16,
          ),
        ),
        trailing:Column(
          children: [
            Image(
              image: AssetImage("assets/image/humidity.png"),
              width: 20,
            ),
            Text(
              history['humidity'].toString() +" %",
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
              ),
            ),
          ],
        ),
        //   SvgPicture.asset("assets/icons/humidity.svg")
        // Text(
        //   history['day'].toString(),
        //   style: const TextStyle(
        //     color: Colors.black45,
        //     fontSize: 16,
        //   ),
        // ),
      ),
    );
  }
}
