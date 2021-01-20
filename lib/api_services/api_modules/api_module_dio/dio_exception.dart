class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "");
}

abstract class BaseHttpException {}

class DioErrorException extends BaseHttpException {
  final int code;
  final String message;

  DioErrorException(this.message, {this.code = 200});
  @override
  String toString() {
    return this.message;
  }
}

class ServerErrorException extends BaseHttpException {
  final String message;

  ServerErrorException(this.message);

  @override
  String toString() {
    return this.message;
  }
}

class ServerResponseException extends BaseHttpException {
  final String message;

  ServerResponseException(this.message);

  @override
  String toString() {
    return this.message;
  }
}