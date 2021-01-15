class BaseResponse {
  int status;
  String msg;

  BaseResponse({this.status, this.msg});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['status'],
      msg: json['msg'],
    );
  }
}