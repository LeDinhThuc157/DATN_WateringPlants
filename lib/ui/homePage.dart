import 'package:apptuoicay/widgets/category_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 10),
              // crossAxisSpacing: 30,
              // mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                CategoryGrid(
                  category: 'Settings',
                  color: Colors.purple.shade500,
                  onTap: () {},
                ),
                CategoryGrid(
                  category: 'Timers',
                  color: Colors.blue.shade300,
                  onTap: () {},
                ),
                CategoryGrid(
                  category: 'Logs',
                  color: Colors.orange.shade500,
                  onTap: () {},
                ),
                CategoryGrid(
                  category: 'Other',
                  color: Colors.red.shade500,
                  onTap: () {},
                ),
              ],
            ),
          ),

        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
