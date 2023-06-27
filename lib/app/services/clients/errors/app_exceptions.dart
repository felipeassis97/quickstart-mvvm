import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable {}

// 400: Bad Request
class BadRequestFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// 401: Unauthorized
class UnauthorizedFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// 404: Not Found
class NotFoundFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// 500: Internal Server Error
class InternalServerErrorFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// 503: Service Unavailable
class ServiceUnavailableFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// Unknown Error
class UnknownErrorFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}

// Time out
class TimeOutFailure extends AppFailure {
  @override
  List<Object?> get props => [];
}
