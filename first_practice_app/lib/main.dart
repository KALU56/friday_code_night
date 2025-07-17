import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first practce app',
      home: homepage(), 
    );
  }
}
class homepage extends StatelessWidget{
  const homepage({super.key});
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('hy kal welcome to this'),
      ),
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}