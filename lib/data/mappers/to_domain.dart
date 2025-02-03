import 'package:one_flutter_app/data/model/user_dto.dart';
import 'package:one_flutter_app/domain/model/user.dart';

extension ToUserExtension on UserDTO {
  User toDomain() {
    return User(name: name, details: details);
  }
}
