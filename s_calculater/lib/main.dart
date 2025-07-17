import 'package:flutter/material.dart';

void main() {
  runApp(const s_Calculater());
}
class s_Calculater extends StatelessWidget {
  const s_Calculater({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: s_CalculaterUi(),
    );
  }
}
class s_CalculaterUi extends StatelessWidget {
  const s_CalculaterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: PreferredSize(preferredSize: Size.fromHeight(100), 
      child: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 163, 81, 56),
      )),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("AC")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text("()")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" %")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" /")),
                SizedBox(width: 10),
            
              ],
            ),/////number1 row


              Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text(" 7")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" 8")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" 9")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" *")),
                SizedBox(width: 10),
            
              ],
            ),/////number2 row


              Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text(" 4")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" 5")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" 6")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" -")),
                SizedBox(width: 10),
            
              ],
            ),///////number3 row

              Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("1 ")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" 2")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text("3 ")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" +")),
                SizedBox(width: 10),
            
              ],
            ),///////number4 row
              Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text(" 0")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" .")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" x")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text(" =")),
                SizedBox(width: 10),
            
              ],
            ),///////number5 row
          ],
          
        ),
        
      ),
    );
  }
}
