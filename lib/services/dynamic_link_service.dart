import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_firebase/routing/router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DynamicLinkService {
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
        scheme: 'dynamicLink',
        path: initialLink.link.path,
        query: initialLink.link.query,
      );
    } else {
      initialRoute = null;
    }

    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final route = Uri(
        scheme: 'dynamicLink',
        path: event.link.path,
        queryParameters: event.link.queryParametersAll,
      );

      GoFirebaseRouter.instance.router.go(route.toString());
    });

    _completer.complete(true);
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
