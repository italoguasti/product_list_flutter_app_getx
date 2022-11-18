class NotFoundException implements Exception {
  final String errorMessage;

  NotFoundException({required this.errorMessage});
}

class UnauthorizedException implements Exception {
  final String errorMessage;

  UnauthorizedException({required this.errorMessage});
}



// FALTA LOGIN BODY E SIGNUP BODY