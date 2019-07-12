///Cookie工具类 [貌似没用]
class CookieUtil {
  List<Map<String, String>> _cookieList;

  CookieUtil._internal() {
    _cookieList = [];
  }

  static CookieUtil _instance;

  static CookieUtil _getInstance() => _instance ?? CookieUtil._internal();

  ///获取去当前类对象
  static get INSTANCE => _getInstance();

  ///清空cookie
  void clearCookies() => _cookieList?.clear();

  ///添加单个cookie
  void setCookie(Map<String, String> cookie) {
    _cookieList.add(cookie);
  }

  ///添加cookie列表
  void setCookieList(List<Map<String, String>> list, {saveOldCookies = true}) {
    if (!saveOldCookies) {
      //清空原来的cookie，添加新的
      clearCookies();
      _cookieList = list;
      return;
    }
    _cookieList.addAll(list);
  }

  ///获取Cookie列表
  List<Map<String, String>> getCookieList() => _cookieList;
}
