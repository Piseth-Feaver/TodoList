import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String _token = 'token';
const String _profile = 'profile';
const String _photo = 'photo';
const String _tokenId = 'token_id';
const String _baseUrl = 'baseUrl';
const String _username = 'username';
const String _theme = 'theme';
const String _userType = 'userType';
const String _notificationToken = 'notificationToken';

class StorageService extends GetxService {
  final _box = GetStorage();
  final _loggedIn = RxBool(false);

  @override
  Future<void> onInit() async {
    var profile = _box.read(_profile);
    if (profile == null) {
      _loggedIn.value = false;
    }
    if (!_loggedIn.value) {
      await _box.erase();
    }
    super.onInit();
  }

  Future<void> setBaseUrl(String url) async {
    await _box.write(_baseUrl, url);
  }

  Future<void> setToken(String token) async {
    await _box.write(_token, token);
    _loggedIn.value = true;
  }

  Future<void> setRefreshToken(String token) async {
    await _box.write(_token, token);
  }

  Future<void> setTokenId(String tokenId) async {
    await _box.write(_tokenId, tokenId);
    _loggedIn.value = true;
  }



  String? get usertype => _box.read(_userType);

  Map<String, dynamic> get profile => _box.read(_profile);

  Future<void> setProfile(Map<String, dynamic> value) async {
    await _box.write(_profile, value);
  }

  Future<void> setUserType(String value) async {
    await _box.write(_userType, value);
  }
  String? get username => _box.read(_username);

  Future<void> setUsername(String value) async {
    await _box.write(_username, value);
  }
  String get token => _box.read(_token) ?? '';


  Future<void> setNotificationToken(String token) async {
    await _box.write(_notificationToken, token);
  }
}