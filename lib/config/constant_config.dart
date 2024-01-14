import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  final String baseUrl = dotenv.get('BASE_URL');
  final String accessKey = dotenv.get('ACCESS_KEY');
  final String secretKey = dotenv.get('SECRET_KEY');
  final String appID = dotenv.get('APP_ID');
}
