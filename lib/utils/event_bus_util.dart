///事件总线
typedef EventCallback = void Function(dynamic arg);

class EventBusUtil {
  Map<Object, List<EventCallback>> _eventMap;

  EventBusUtil._() {
    print('EventBusUtil构造方法执行');
    _eventMap = Map();
  }

  static EventBusUtil _instance;

  static EventBusUtil _getInstance() => _instance ??= EventBusUtil._();

  ///获取 引用对象
  static EventBusUtil get instance => _getInstance();

  ///添加订阅者
  void register(eventName, EventCallback f) {
    if (eventName == null || f == null) {
      return;
    }
    _eventMap[eventName] ??= List<EventCallback>();
    _eventMap[eventName].add(f);
  }

  ///移除订阅者
  void unRegister(eventName, [EventCallback f]) {
    var list = _eventMap[eventName];
    if (eventName == null || list == null) {
      return;
    }
    if (f == null) {
      _eventMap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  ///触发事件，所有订阅者会收到消息
  void postEvent(eventName, [arg]) {
    var list = _eventMap[eventName];
    if (list == null) {
      return;
    }

    int len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (int i = len; i >= 0; i--) {
      list[i](arg);
    }
  }
}
