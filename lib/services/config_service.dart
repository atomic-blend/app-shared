import 'package:ab_shared/entities/config/ab_config.dart';
import 'package:ab_shared/utils/api_client.dart';

class ConfigService {
  final ApiClient globalApiClient;
  ConfigService({required this.globalApiClient});

  Future<ABConfig> loadConfig() async {
    final result = await globalApiClient.get('/config');
    return ABConfig.fromJson(result.data);
  }
}