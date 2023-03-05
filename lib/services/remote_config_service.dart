import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static RemoteConfigService? _instance;
  static RemoteConfigService get instance =>
      _instance ??= RemoteConfigService._();

  RemoteConfigService._() {
    _init();
  }

  void _init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await remoteConfig.setDefaults(
      const {
        "editor_super_power": false,
      },
    );

    // as described in loading strategy n.3
    // https://firebase.google.com/docs/remote-config/loading?hl=en#strategy_3_load_new_values_for_next_startup
    await remoteConfig.activate();
    await remoteConfig.fetch();
  }
}
