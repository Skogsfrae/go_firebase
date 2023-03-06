import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';

class RemoteConfigService {
  static RemoteConfigService? _instance;
  static RemoteConfigService get instance =>
      _instance ??= RemoteConfigService._();

  final _logger = Logger('RemoteConfigService');

  RemoteConfigService._() {
    _init();
  }

  void _init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 10),
      ),
    );

    await remoteConfig.setDefaults(
      const {
        "editor_super_powers": false,
      },
    );

    // as described in loading strategy n.3
    // https://firebase.google.com/docs/remote-config/loading?hl=en#strategy_3_load_new_values_for_next_startup
    await remoteConfig.activate();
    await remoteConfig.fetch();

    _logger.info('Initialized');
    _logger.info('Last fetch time: ${remoteConfig.lastFetchTime}');
    _logger.info('Last fetch status: ${remoteConfig.lastFetchStatus}');
    _logger.info('Last activated values: {');
    remoteConfig.getAll().forEach(
          (key, value) => _logger.info('\t$key: ${value.asString()},'),
        );
    _logger.info('}');
  }

  bool get hasEditorSuperPowers =>
      FirebaseRemoteConfig.instance.getBool('editor_super_powers');
}
