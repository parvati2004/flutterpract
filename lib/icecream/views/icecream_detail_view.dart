import 'package:flutter/material.dart';
import 'package:flutterpract/icecream/model/icecream.dart';

class IcecreamDetailView extends StatelessWidget {
   IcecreamDetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(icecream.flavor),
        elevation: 0.0,
      ),
      body:Column(
        
        children: [
          Expanded(
            child:Image.network(
              icecream.image,
              fit:BoxFit.cover,
              width:MediaQuery.sizeOf(context).width,
              height:300,
              ) 
          ),
          Padding(
            padding: const  EdgeInsets.all(16.0),
            child:Column(
              children: [
                Text(
                  icecream.flavor,
                  style:Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "\$${icecream.price.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          )
        ],

      )
      
    );
  }
}