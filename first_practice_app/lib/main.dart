import 'package:flutter/material.dart';

void main(){
  runApp(Kal());

}
class Kal extends StatelessWidget {
  const Kal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first practce app',
      home: Homepage(), 
    );
  }
}
class Homepage extends StatelessWidget{
  const Homepage({super.key});
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