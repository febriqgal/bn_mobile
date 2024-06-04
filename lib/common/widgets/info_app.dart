import 'package:package_info_plus/package_info_plus.dart';

late String appName;
late String packageName;
late String appVersion;
late String appBuildNumber;

class AppInfo {
  static Future<void> init() => PackageInfo.fromPlatform().then((value) {
        packageName = value.packageName;
        appVersion = value.version;
        appBuildNumber = value.buildNumber;
      });
}
