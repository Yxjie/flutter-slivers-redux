# flutter_list_redux

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

### 项目基本结构(Fish Redux 以及 MVP方式)
##### 项目采用咸鱼Fish Redux框架，基于Flutter sdk 1.5.4 ,Redux版本：0.2.0 (最新版本：Flutter :1.7.8 Redux:0.2.4)

## <font color=red>注：每个界面定义一个对应类型page包，里面包含：effect，reducer，state,adapter,component.</font>
## <font color=red>注：界面逻辑简单，单一列表页，不建议使用Fish Redux（个人建议后期在验证）</font>

## MVP框架在./lib/mvp 文件中，基础类base文件夹中，使用方法在login文件夹中

* ./images :图片resources

* ./jpush : 极光工具类
> res包下使用 直接在对应dart文件中 import '.../res_index.dart'
* ./res/colors.dart :定义常用颜色
* ./res/dimens.dart :定义常用的大小包括：字号以及padding，margin值
* ./res/strings.dart:字符串资源，项目中字符串引用最好从当中引用

> utils包下 直接在对应dart文件中 import '.../util_index.dart'
* ./utils/common_util.dart :定义常用工具（屏幕宽度，屏幕高度，图片资源引用方法，拨打电话以及打开设备默认浏览器方式）
* ./utils/cookie_util.dart :暂时感觉用不到 todo
* ./utils/debug_log_util.dart : debug日志打印工具类 （release包记得修改标志）
* ./utils/http_util.dart : 网络请求类，包括get，post,post表单请求，下载文件（未测试）
* ./utils/navigator_util.dart : 界面跳转工具类 （路由表跳转方式未提供）
* ./utils/package_utils.dart : 包工具类：packageInfo数据提供【versionName,versionCode,appName 等】
* ./utils/share_preferences.dart: 数据保存


### Todo（学习研究）
1.相关工具类使用方法 Demo 未提供
2.db : 数据库
3.推送功能以及推送进来定义路由跳转方式（路由跳转有点问题）
4.地图定位
5.本项目考虑纯Flutter（混合开发工具类暂时不加）
6.多渠道打包（不清楚怎么设置）
7.相册图片选择



