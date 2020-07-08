import 'package:shared_preferences/shared_preferences.dart';

///SharePreference 工具类
class SPUtil {
  ///私有构造方法
  SPUtil._();

  static SharedPreferences _sp;

  static SPUtil _instance;

  Future _init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static Future<SPUtil> _getInstance() async {
    if (_instance == null) {
      _instance = SPUtil._();
      await _instance._init();
    }
    return _instance;
  }

  ///获取对象
  static Future<SPUtil> get instance async => await _getInstance();

  ///判断是否有_sp
  bool _beforeCheck() {
    return _sp == null;
  }

  ///获取所有Keys
  Set<String> getKeys() {
    if (_beforeCheck()) return null;
    return _sp.getKeys();
  }

  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  get(String key) {
    if (_beforeCheck()) return null;
    return _sp.get(key);
  }

  getString(String key) {
    if (_beforeCheck()) return null;
    return _sp.getString(key);
  }

  Future<bool> putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _sp.setString(key, value);
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _sp.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _sp.setBool(key, value);
  }

  int getInt(String key) {
    if (_beforeCheck()) return null;
    return _sp.getInt(key);
  }

  Future<bool> putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _sp.setInt(key, value);
  }

  double getDouble(String key) {
    if (_beforeCheck()) return null;
    return _sp.getDouble(key);
  }

  Future<bool> putDouble(String key, double value) {
    if (_beforeCheck()) return null;
    return _sp.setDouble(key, value);
  }

  List<String> getStringList(String key) {
    return _sp.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    if (_beforeCheck()) return null;
    return _sp.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforeCheck()) return null;
    return _sp.get(key);
  }

  ///移除对应 key 数值
  Future<bool> remove(String key) {
    if (_beforeCheck()) return null;
    return _sp.remove(key);
  }

  /// share preferences 数据清空
  Future<bool> clear() {
    if (_beforeCheck()) return null;
    return _sp.clear();
  }
}
