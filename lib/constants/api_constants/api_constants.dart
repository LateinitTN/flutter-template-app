const String BaseUrlProd = "https://jsonplaceholder.typicode.com/";
const String BaseUrlDev = "https://jsonplaceholder.typicode.com/";

class ApiMethod {
  static const String GET = "get";
  static const String POST = "post";
}


class ErrorMessage {
  static const UNEXPECTED_ERROR = "An unexpected error occur!";
  static const CONNECTION_ERROR =
      "Error connecting to server. Please check your internet connection or Try again later!";
  static const TIMEOUT_ERROR =
      "Connection timeout. Please check your internet connection or Try again later!";
}

//Routes
const String getAlbums = "albums";