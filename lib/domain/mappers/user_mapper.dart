import '../../data/dto/user_dto.dart';
import '../models/user.dart';

extension UserMapper on UserDto {
  User toDomain() {
    return User(
      id: id,
      fullName: name,
      email: email,
    );
  }
}
