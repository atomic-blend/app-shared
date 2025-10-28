import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher {
  static Future<void> launchUrl(
    String url, {
    LaunchMode mode = LaunchMode.externalApplication,
    String webOnlyWindowName = '_blank',
  }) async {
    if (!await launchUrlString(
      url,
      mode: mode,
      webOnlyWindowName: webOnlyWindowName,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
