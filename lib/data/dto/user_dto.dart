class UserDto {
  final int id;
  final String name;
  final String email;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
