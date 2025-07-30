import 'package:flutter/material.dart';

class AllDetal extends StatelessWidget {
  const AllDetal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Task List',style: TextStyle(fontWeight: FontWeight.bold),)
 
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  width: double.infinity,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grocery'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Text('7 completed'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('15 Note'), Icon(Icons.arrow_back)],
                        ),
                      ],
                    ),
                  ),
                ), ////#1
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 233, 3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  width: double.infinity,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grocery'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Text('7 completed'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('15 Note'), Icon(Icons.arrow_back)],
                        ),
                      ],
                    ),
                  ),
                ), /////#2
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 141, 245, 5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  width: double.infinity,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grocery'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Text('7 completed'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('15 Note'), Icon(Icons.arrow_back)],
                        ),
                      ],
                    ),
                  ),
                ), /////#3
              ],
            ),
          ],
        ),
      ),
    );
  }
}
