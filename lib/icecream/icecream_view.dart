

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpract/icecream/model/icecream.dart';

class IcecreamView extends StatelessWidget {
  IcecreamView({super.key});




   Future<IcecreamData> loadIcecreams() async{
   final rawIcecreams= await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(Duration(seconds:1));
   final icecreams = IcecreamData.fromJson(json.decode(rawIcecreams));
    return icecreams;
  
   }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Text("Icecream",
          style:TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,

          )
          ),
          Text("we have something yummy for you",
          style:Theme.of(context).textTheme.bodySmall,
          ),
         Expanded(child: Center(
        
           child: Column
           (
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(future:loadIcecreams(), 
              builder:(context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  final icecreams=snapshot.data;
                  
                 
                  return SizedBox(
                    width:MediaQuery.sizeOf(context).width,
                    height:MediaQuery.sizeOf(context).height/3,
                    child: ListView.builder(
                    
                      itemBuilder:(context,index){
                      final icecream = icecreams.icecreams[index];

                      return SizedBox(
                        width:200,
                        child: Card( 
                          clipBehavior: Clip.hardEdge,
                          color:Colors.orange.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child:Stack(
                            fit:StackFit.expand,
                        
                            children: [
                              Image.network(
                                icecream.image,
                                fit:BoxFit.cover,
                                color:Colors.deepOrange.withOpacity(0.5),
                                colorBlendMode: BlendMode.color,

                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                     child: Padding(
                                       padding: const EdgeInsets.all(16.0),
                                       child:Column(
                                       crossAxisAlignment:CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                        Text(icecream.flavor,
                                       style:Theme.of(context)
                                       .textTheme.labelLarge,
                                     ),
                                       ],
                                       ),
                                  )
                                )
                                

                            ],
                      
                            )
                    
                        ),
                      );
                    } ,
                    scrollDirection: Axis.horizontal,
                    itemCount: icecreams!.icecreams.length),
                  );

                }
                else{
                  return const Center(child:CircularProgressIndicator.adaptive());
                }
             
              })
          
           
           ],),
         ),)
        ],
      ),
    );
  }
  

}