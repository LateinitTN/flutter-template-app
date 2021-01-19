class BaseResponse {
  int status;
  String message;

  BaseResponse({this.status, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  BaseResponse.withError(int status, String error): status = status, message = error;
}