import 'package:equatable/equatable.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/client_exception.dart';

abstract base class BaseFailure extends Equatable {}

// 400: Bad Request
final class BadRequestFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}

// 401: Unauthorized
final class UnauthorizedFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}

// 404: Not Found
final class NotFoundFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}

// 500: Internal Server Error
final class InternalServerErrorFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}

// 503: Service Unavailable
final class ServiceUnavailableFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}

// Unknown Error
final class ApiUnknownErrorFailure extends BaseFailure {
  final ClientException? exception;
  ApiUnknownErrorFailure({
    this.exception,
  });
  @override
  List<Object?> get props => [];
}

// Time out
final class TimeOutFailure extends BaseFailure {
  @override
  List<Object?> get props => [];
}
