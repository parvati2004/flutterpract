import 'package:flutter/material.dart';
import 'package:flutterpract/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
        body: SafeArea(
       
          child:CalculatorView(),
        
        ),
      );
  }
}