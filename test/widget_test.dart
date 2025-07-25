import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpract/app/app.dart';

void main(){
  testWidgets("Hello World Test",(WidgetTester tester)async{

    await tester.pumpWidget(const MyApp());

    expect(find.byType(Container), findsOneWidget);
     expect(find.text("Hello World"), findsOneWidget);
     expect(find.byType(Center), findsOneWidget);

  });
}