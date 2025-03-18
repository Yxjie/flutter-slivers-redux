// import 'package:flutter_list_rdux/utils/util_index.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';
// import 'package:toast/toast.dart';
//
// ///文档：https://github.com/jpush/jpush-flutter-plugin/blob/master/documents/APIs.md
// ///JPush推送工具类
// class JPushManager {
//   static final _tag = "JPushManager";
//
//   static final _appKey = "90a526c60831f98453a1b974";
//
//   JPush _jPush;
//
//   JPushManager._() {
//     _jPush = JPush();
//
//     _jPush.setup(
//         appKey: _appKey,
//         production: false,
//         channel: "theChannel",
//         debug: DebugLogUtil.isDebug);
//
//     //获取 registrationId
//     _jPush.getRegistrationID().then((rid) {
//       DebugLogUtil.printLog("Flutter registrationId : $rid", tag: _tag);
//     });
//
//     //通知授权是否打开
//     isNotifyOpened();
//
//     //推送回调
//     _jPush.addEventHandler(onReceiveMessage: (Map<String, dynamic> msg) async {
//       //接收自定义消息回调方法
//       //todo 可创建本地通知
//       DebugLogUtil.printLog("Flutter onReceiveMessage : $msg", tag: _tag);
// //      sendLocalNotification(msg);
//     }, onOpenNotification: (Map<String, dynamic> msg) async {
//       //点击通知回调方法
//       //todo 点击跳转对应界面
//       DebugLogUtil.printLog("Flutter onOpenNotification : $msg", tag: _tag);
// //      openAppByNotify();
//     }, onReceiveNotification: (Map<String, dynamic> msg) async {
//       //接收通知回调方法 msg['message']
//       DebugLogUtil.printLog("Flutter onReceiveNotification : $msg", tag: _tag);
//     });
//   }
//
//   static JPushManager _instance;
//
//   static JPushManager _getInstance() {
//     if (_instance == null) {
//       _instance = JPushManager._();
//     }
//     return _instance;
//   }
//
//   ///获取工具类实例
//   static JPushManager get instance => _getInstance();
//
//   ///申请推送权限（仅适用于IOS）
//   applyJPushAuthorityIOS() {
//     _jPush.applyPushAuthority(
//         NotificationSettingsIOS(sound: true, alert: true, badge: true));
//   }
//
//   /// 设置别名
//   setupAlias(String alias) {
//     _jPush.setAlias(alias).then(
//         (map) => DebugLogUtil.printLog("alias 设置success ${map.toString()}",
//             tag: _tag),
//         onError: (error) => DebugLogUtil.printLog(
//             "alias 设置失败！ ${error.toString()}",
//             tag: _tag));
//   }
//
//   ///删除别名
//   deleteAlias() {
//     _jPush.deleteAlias().then(
//         (map) => DebugLogUtil.printLog("alias 删除success ${map.toString()}",
//             tag: _tag),
//         onError: (error) =>
//             DebugLogUtil.printLog("alias 删除失败！ $error", tag: _tag));
//   }
//
//   /// 恢复推送
//   resumeJPush() {
//     stopJPush();
//     _jPush.resumePush();
//   }
//
//   ///停止 消息推送
//   stopJPush() {
//     //清楚通知栏所有消息
//     _jPush.clearAllNotifications();
//     _jPush.stopPush();
//   }
//
//   ///打开系统设置
//   openSystemSetting() {
//     _jPush.openSettingsForNotification();
//   }
//
//   ///判断用户是否打开通知
//   isNotifyOpened() {
//     _jPush.isNotificationEnabled().then((value) {
//       if (!value) {
//         openSystemSetting();
//       }
//     }).catchError((error) {
//       DebugLogUtil.printLog('Jpush error : $error', tag: _tag);
//     });
//   }
//
//   /// 发送本地推送
//   /// 样式{"title":"","des":""}
//   sendLocalNotification(Map<String, dynamic> extraMap) {
//     var fireDate = DateTime.fromMillisecondsSinceEpoch(
//         DateTime.now().millisecondsSinceEpoch + 3000);
//     final id = 5506;
//     final title = "yxjie";
//     final des = '无穷般若心自在，语默动静以自然。';
//     var localNotification = LocalNotification(
//       id: id,
//       buildId: 1,
//       // 1 为基础样式，2 为自定义样式
//       title: title,
//       content: des,
//       subtitle: "",
//       extra: extraMap,
//       badge: 0,
//       //应用边上小红点，目前只支持华为手机
//       fireTime: fireDate,
//     );
//     _jPush.sendLocalNotification(localNotification).then((res) {
//       DebugLogUtil.printLog("Flutter sendLocalNotification : $res", tag: _tag);
//     }, onError: (error) {
//       DebugLogUtil.printLog("Flutter 通知失败 : $error", tag: _tag);
//     });
//   }
//
//   ///点击推送启动应用的那条通知 [仅支持ios]
//   openAppByNotify() {
//     _jPush.getLaunchAppNotification().then((map) {
//       DebugLogUtil.printLog("Flutter openAppByNotify : ${map.toString()}",
//           tag: _tag);
//     }).catchError((error) {
//       DebugLogUtil.printLog("Flutter openAppByNotify : ${error.toString()}",
//           tag: _tag);
//     });
//   }
// }
