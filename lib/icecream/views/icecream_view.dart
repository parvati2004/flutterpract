

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpract/icecream/model/icecream.dart';
import 'package:flutterpract/icecream/views/icecream_detail_view.dart';
import 'package:flutterpract/icecream/widgets/icecream_card.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});




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
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height:30),

         Expanded(
        
           child: Column
           (
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(future:loadIcecreams(), 
              builder:(context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  final icecreams=snapshot.data;
                 
                  
                 
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:MediaQuery.sizeOf(context).width,
                        height:MediaQuery.sizeOf(context).height/3,
                        child: ListView.builder(
                        
                          itemBuilder:(context,index){
                          final icecream = icecreams.icecreams[index];
                          

                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:(context)=>
                                  IcecreamDetailView(
                                    icecream: icecream))
                              );


                            },
                            child: IcecreamCard(icecream: icecream));
                        } ,
                        scrollDirection: Axis.horizontal,
                        itemCount: icecreams!.icecreams.length
                        ),
                      ),
                      SizedBox(height: 30,),
                      

                    ],
                  );

                }
                else{
                  return const Center(child:CircularProgressIndicator.adaptive());
                }
             
              })
          
           
           ],),
         ),
        ],
      ),
    );
  }
  

}

