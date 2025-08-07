import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String username;
  final String email;
  final String? deviceId; // Opsional

  const User({
    required this.userId,
    required this.username,
    required this.email,
    this.deviceId,
  });

  @override
  List<Object?> get props => [userId, username, email, deviceId];
}
