import 'package:flutter/material.dart';
import 'package:flutterpract/icecream/model/icecream.dart';

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
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
                   child: Container(
                     padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight:Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                     child: Column(
                     crossAxisAlignment:CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.end,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                      Text(
                        icecream.flavor,
                     style:Theme.of(context)
                     .textTheme.labelLarge,
                                        ),
                     Text(
                        "\$${icecream.price.toString()}",
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
  }
}