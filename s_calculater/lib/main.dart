import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}
class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      title: 'Calculator',
      home: CalculatorUi(),
    );
  }
}
class CalculatorUi extends StatelessWidget {
  const CalculatorUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: PreferredSize(preferredSize: Size.fromHeight(230), 
      child: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 114, 103, 100),
      )),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("AC"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("( )"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("%"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("/"),
                  
                  ),
                ),
                
                
            
              ],
            ),/////number1 col

              SizedBox(height: 20),

              Row(
               children: [
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("7"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("8"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("9"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("*"),
                  
                  ),
                ),
                
                
            
              ],
            ),///////number2 col
              SizedBox(height: 20),


              Row(
               children: [
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("4"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("5"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("6"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("-"),
                  
                  ),
                ),
                
                
            
              ],
            ),///////number3 col



              SizedBox(height: 20),
              Row(
               children: [
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("1"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("2"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("3"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("+"),
                  
                  ),
                ),
                
                
            
              ],
            ),///////number4 col
              SizedBox(height: 20), 
              Row(
               children: [
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("0"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("."),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("x"),
                  
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("="),
                  
                  ),
                ),
                
                
            
              ],
            ),///////number5 col
          ],
          
        ),
        
      ),
    );
  }
}
