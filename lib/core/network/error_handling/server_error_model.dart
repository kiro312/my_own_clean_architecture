class ServerErrorModel {
  int statusCode;
  String dioMessage;
  String? serverMessage;

  ServerErrorModel({
    required this.statusCode,
    required this.serverMessage,
    required this.dioMessage,
  });

  @override
  String toString() {
    return 'ServerErrorModel{statusCode: $statusCode, serverMessage: $serverMessage, dioMessage: $dioMessage}';
  }
}
