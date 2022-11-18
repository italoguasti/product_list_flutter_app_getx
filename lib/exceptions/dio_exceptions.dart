class NotFoundException implements Exception {
  final String errorMessage;

  NotFoundException({required this.errorMessage});
}

class UnauthorizedException implements Exception {
  final String errorMessage;

  UnauthorizedException({required this.errorMessage});
}

class BadGatewayException implements Exception {
  final String errorMessage;

  BadGatewayException({required this.errorMessage});
}

class BadRequestException implements Exception {
  final String errorMessage;

  BadRequestException({required this.errorMessage});
}
// FALTA LOGIN BODY E SIGNUP BODY