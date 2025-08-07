import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String accessToken;
  final String tokenType;
  final int expiresIn; // Durasi token sebelum expired

  const Auth({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  @override
  List<Object?> get props => [accessToken, tokenType, expiresIn];
}
