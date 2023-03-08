import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_firebase/routing/router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DynamicLinkService {
  static String dynamicLinkScheme = 'dynamiclink';
  static DynamicLinkService? _instance;
  static DynamicLinkService get instance =>
      _instance ??= DynamicLinkService._();

  DynamicLinkService._() {
    _init();
  }

  final _completer = Completer<bool>();
  Future<bool> get initialized => _completer.future;

  late final Uri? initialRoute;

  Future<void> _init() async {
    final initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      initialRoute = Uri(
        scheme: dynamicLinkScheme,
        path: initialLink.link.path,
        query: initialLink.link.query,
      );
    } else {
      initialRoute = null;
    }

    FirebaseDynamicLinks.instance.onLink.listen(_onLinkCallback);

    _completer.complete(true);
  }

  void _onLinkCallback(PendingDynamicLinkData data) {
    final route = Uri(
      scheme: dynamicLinkScheme,
      path: data.link.path,
      queryParameters: data.link.queryParametersAll,
    );

    GoFirebaseRouter.instance.router.go(route.toString());
  }

  Future<String> getDynamicLinkFromLocation(String location) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(location).replace(
        scheme: 'https',
        host: 'gofirebase.page.link',
      ),
      uriPrefix: "https://gofirebase.page.link",
      androidParameters: AndroidParameters(
        packageName: packageInfo.packageName,
      ),
      iosParameters: IOSParameters(
        bundleId: packageInfo.packageName,
      ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}
