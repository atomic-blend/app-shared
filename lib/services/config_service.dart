import 'package:ab_shared/entities/config/ab_config.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:get_it/get_it.dart';

class ConfigService {
  final getIt = GetIt.instance;
  late final ApiClient globalApiClient;
  ConfigService() {
    globalApiClient = getIt<ApiClient>();
  }

  Future<ABConfig> loadConfig() async {
    final result = await globalApiClient.get('/config');
    return ABConfig.fromJson(result.data);
  }
}