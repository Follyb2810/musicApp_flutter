class AppFailure {
  String message;
  int statusCode;
  dynamic data;

  //? 1
  // AppFailure(String message, int statusCode, dynamic data) {
  //   this.message = message;
  //   this.statusCode = statusCode;
  //   this.data = data;
  // }
  //? 2
  // AppFailure(String message, int statusCode, dynamic data)
  //     : message = message,
  //       statusCode = statusCode,
  //       data = data;
  //? 3
  // AppFailure(String message, int statusCode, dynamic data)
  //   : message = message,
  //     statusCode = statusCode,
  //     data = data;
  //? 4
  AppFailure({
    this.message = 'An unexpected error occurred',
    this.statusCode = 400,
    this.data,
  });

  @override
  String toString() {
    return 'UserModel(user: $data, statusCode: $statusCode, message: $message)';
  }
}
