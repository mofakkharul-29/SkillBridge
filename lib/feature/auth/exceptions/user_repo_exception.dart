class UserRepoException implements Exception {
  final String code;
  final String message;

  const UserRepoException({required this.code, required this.message});

  @override
  String toString() => 'UserRepoException($code): $message';
}
