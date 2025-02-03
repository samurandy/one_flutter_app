import 'package:one_flutter_app/data/repository/user_repository.dart';
import 'package:one_flutter_app/domain/model/user.dart';

class GetUsersUseCase {
  final UserRepository userRepository;
  GetUsersUseCase(this.userRepository);
  Future<List<User>> call() async {
    return userRepository.getUsers();
  }
}
