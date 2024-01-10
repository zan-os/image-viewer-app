import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  static String baseUrl = dotenv.get('BASE_URL');
  static String accessKey = dotenv.get('ACCESS_KEY');
  static String secretKey = dotenv.get('SECRET_KEY');
  static String appID = dotenv.get('APP_ID');
}
