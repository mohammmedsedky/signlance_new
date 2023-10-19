class ServiceConst {
  static const baseUrl = "https://saqaa.al7osam.net/";

  // network unknown error codes
  static const cancel = 1;
  static const connectTimeout = 2;
  static const receiveTimeout = 3;
  static const sendTimeout = 4;
  static const noInternet = 5;

  // ** End Points

  // * Auth
  static const login = "api/auth/Login";
}

String? provideImagePath(String? imagePath) => imagePath == null ? null : "${ServiceConst.baseUrl}$imagePath";
