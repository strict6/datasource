import '../api/user_api.dart';
import '../../domain/models/user.dart';
import '../../domain/mappers/user_mapper.dart';

class UserDataSource {
  final UserApi userApi;

  UserDataSource(this.userApi);

  Future<List<User>> fetchUsers() async {
    final userDtos = await userApi.getUsers();
    return userDtos.map((dto) => dto.toDomain()).toList();
  }
}
