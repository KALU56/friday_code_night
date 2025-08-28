import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_/usermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 MyHomePage({super.key});


  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final placeController = TextEditingController();

final dio = Dio(BaseOptions(
  baseUrl: 'http://localhost:3000',
 
));
Future<void> createUser(User user) async {
  final response = await dio.post('/users', data: user.toJson());
 
}

Future<void> getUsers() async {
  final response = await dio.get('/users');
  print("Users: ${response.data}");
}

Future<void> updateUser(int id, User user) async {
  final response = await dio.put('/users/$id', data: user.toJson());
  print("Updated: ${response.data}");
}

Future<void> deleteUser(int id) async {
  final response = await dio.delete('/users/$id');
  print("Deleted: ${response.data}");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextFields
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
         

                        // Buttons in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final user = User(
                      name: nameController.text,
                      username: usernameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                
                    );
                    createUser(user);
                  },
                  child: const Text("Create"),
                ),
                ElevatedButton(
                  onPressed: () {
                    getUsers();
                  },
                  child: const Text("Read"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final user = User(
                      name: nameController.text,
                      username: usernameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                
                    );
                    updateUser(2, user); 
                  },
                  child: const Text("Update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteUser(1); 
                  },
                  child: const Text("Delete"),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
