import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:go_router/go_router.dart';

class DynamicLinkService {
  static DynamicLinkService? _instance;
  static DynamicLinkService get instance =>
      _instance ??= DynamicLinkService._();

  DynamicLinkService._();

  Future<String> getDynamicLinkFromGoRouterState(GoRouterState state) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(state.location).replace(
        scheme: 'https',
        host: 'gofirebase.page.link',
      ),
      uriPrefix: "https://gofirebase.page.link",
      androidParameters: AndroidParameters(
          packageName: FirebaseAuth.instance.app.options.appId),
      iosParameters:
          IOSParameters(bundleId: FirebaseAuth.instance.app.options.appId),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}