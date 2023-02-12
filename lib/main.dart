import 'package:flutter/material.dart';
import 'package:local_api/screens/mainPage.dart';

main(){
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MainPage.routeName :(context) => MainPage()
      },
    );
  }
}