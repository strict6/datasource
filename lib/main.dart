import 'package:flutter/material.dart';
import 'data/api/user_api.dart';
import 'data/data_source/user_data_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userApi = UserApi('https://jsonplaceholder.typicode.com');
  final userDataSource = UserDataSource(UserApi('https://jsonplaceholder.typicode.com'));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: FutureBuilder(
          future: userDataSource.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.fullName),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else {
              return const Center(child: Text('No users found'));
            }
          },
        ),
      ),
    );
  }
}
