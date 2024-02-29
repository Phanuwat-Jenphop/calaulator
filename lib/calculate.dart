
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // ignore: non_constant_identifier_names
  // Widget _Calculator() {

  //   setState(() {
  
  //     _counter++;
  //   });

  // }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              // _Calculator(),
            ],
          ),

        ]
      ), 
    );
  }
}
