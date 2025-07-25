import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learn",
      home: Material(
        child: Container(
        color:Colors.pink,
        child:Center(child: Text("Hello world",
        style:TextStyle(
          fontSize:40,
          color:Colors.white,
          fontWeight:FontWeight.bold
        )
        )),
        ),
      ),
    );
  }
}
