import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String cinema1BaseUrl =
      dotenv.env['CINEMA_1_BASE_URL'] ?? "CINEMA_1_BASE_URL key not found!";
  static final String cinema1BaseImageUrl =
      dotenv.env['CINEMA_1_BASE_IMAGE_URL'] ??
          "CINEMA_1_BASE_IMAGE_URL key not found!";
}
