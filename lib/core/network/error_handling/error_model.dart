class ErrorModel {
  int? statusCode;
  String? serverMessage;
  String? dioMessage;

  ErrorModel({this.statusCode, this.serverMessage, this.dioMessage});

  // TODO: change the keys with your API response keys
  ErrorModel.fromJson(Map<String, dynamic> json, {String? dioMessage}) {
    statusCode = json['statusCode'] ?? 0;
    serverMessage = json['message'] ?? "";
    this.dioMessage = dioMessage ?? "";
  }

  @override
  String toString() {
    return 'ErrorModel{statusCode: $statusCode, serverMessage: $serverMessage, dioMessage: $dioMessage}';
  }
}
