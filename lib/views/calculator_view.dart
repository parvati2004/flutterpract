import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});



  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
 
 int x=0;
 int y=0;
 num z=0;

 final displayOneController=TextEditingController();
  final displayTwoController=TextEditingController();
 late final AppLifecycleListener _listener;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text=x.toString();
    displayTwoController.text=x.toString();
    _listener=AppLifecycleListener(
      onShow:_onShow,
      onHide:_onHide,
      onResume:_onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause:_onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
      onExitRequested: _onExitRequested
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding:  EdgeInsets.all(32.0),
      child:   Column(
        children: [
          //Calculator Display
          CalculatorDisplay(
            hint:"Enter First Number",
            controller:displayOneController,
            ),
          SizedBox(height:30),
           CalculatorDisplay( hint:"Enter second Number",
            controller:displayTwoController,
           ),
            SizedBox(height:30),
            Text(z.toString(),
            style:TextStyle(
              fontSize:60,
              fontWeight:FontWeight.bold,
            ),
            ),
          Spacer(),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            
            children: [
              FloatingActionButton(
                onPressed:(){
                  setState(() {
                  z=num.tryParse(displayOneController.text)!+num.tryParse(displayTwoController.text)!;
                  print(z);
                    
                  });
                
                },
                 backgroundColor: Colors.deepOrange, 
                child:Icon(CupertinoIcons.add,),
                 ),
                  FloatingActionButton(
                onPressed:(){
                    setState(() {
                  z=num.tryParse(displayOneController.text)!-num.tryParse(displayTwoController.text)!;
                  print(z);
                    
                  });
                },
                 backgroundColor: Colors.deepOrange, 
                child:Icon(CupertinoIcons.minus),
                 ),
                  FloatingActionButton(
                onPressed:(){
                   setState(() {
                  z=num.tryParse(displayOneController.text)!*num.tryParse(displayTwoController.text)!;
                  print(z);
                    
                  });
                },
                 backgroundColor: Colors.deepOrange, 
                child:Icon(CupertinoIcons.multiply),
                 ),
                  FloatingActionButton(
                onPressed:(){
                     setState(() {
                  z=num.tryParse(displayOneController.text)!/num.tryParse(displayTwoController.text)!;
                  print(z);
                    
                  });
                },
                 backgroundColor: Colors.deepOrange, 
                child:Icon(CupertinoIcons.divide),
                 )
                 
            ],
          ),
          SizedBox(height:20),
             FloatingActionButton.extended(
                onPressed:(){
                   setState(() {
                     x=0;
                     y=0;
                     z=0;
                     displayOneController.clear();
                     displayTwoController.clear();
                   });
                },
                label:Text("Clear"),
                 backgroundColor: Colors.deepOrange, 
               
                 ),
      
      
        ],
      
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint="Enter a number",
    required this.controller,
  });
final String?hint;
final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(

      controller:controller,
      keyboardType: TextInputType.number,
      autofocus:true,
             
      decoration: InputDecoration(
         focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.black,
            width:3.0,
          ),
           borderRadius:BorderRadius.circular(10),
         ),
          border:OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.black,
            width:3.0,
          ),
          borderRadius:BorderRadius.circular(10),
          ),
    
        hintText:hint,
        hintStyle:TextStyle(
        color:Colors.black,
        ),
      ),
          
    );
  }
}