import 'package:flutter/material.dart';
import 'package:one_flutter_app/data/repository/user_repository.dart';
import 'package:one_flutter_app/domain/model/user.dart';
import 'package:one_flutter_app/domain/use_cases/get_users_use_case.dart';
import 'package:one_flutter_app/ui/screens/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final GetUsersUseCase getUserUseCase = GetUsersUseCase(UserRepository());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: FutureBuilder(
          future: getUserUseCase.call(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final users = snapshot.data ?? [];
            return _buildItemList(users);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () => print("Hello, there!!"),
      ),
    );
  }
}

Widget _buildItemList(List<User> users) {
  return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.person),
            title: Text(users[index].name),
            subtitle: Text(users[index].details),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                      name: users[index].name, details: users[index].details)),
            ),
          ));
}
