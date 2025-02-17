import 'package:flutter/material.dart';
import 'package:one_flutter_app/data/repository/user_repository.dart';
import 'package:one_flutter_app/domain/use_cases/get_users_use_case.dart';
import 'package:one_flutter_app/ui/screens/home_page.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  final GetUsersUseCase getUserUseCase = GetUsersUseCase(userRepository);

  runApp(MyApp(
    userRepository: userRepository,
    getUserUseCase: getUserUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final GetUsersUseCase getUserUseCase;

  const MyApp(
      {super.key, required this.userRepository, required this.getUserUseCase});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
          title: 'One Flutter App',
          userRepository: userRepository,
          getUserUseCase: getUserUseCase),
    );
  }
}
