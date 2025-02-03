import 'package:one_flutter_app/data/mappers/to_domain.dart';
import 'package:one_flutter_app/data/model/user_dto.dart';
import 'package:one_flutter_app/domain/model/user.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    return fakeUsers.map((dto) => dto.toDomain()).toList();
  }
}

final List<UserDTO> fakeUsers = [
  UserDTO(id: 1, name: "Juan Pérez", details: "Desarrollador Flutter"),
  UserDTO(id: 2, name: "María López", details: "Diseñadora UX/UI"),
  UserDTO(id: 3, name: "Carlos Gómez", details: "QA Engineer"),
  UserDTO(id: 4, name: "Ana Martínez", details: "Project Manager"),
  UserDTO(id: 5, name: "Luis Ramírez", details: "DevOps Engineer"),
];
