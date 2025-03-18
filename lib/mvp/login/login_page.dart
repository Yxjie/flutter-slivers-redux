import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/mvp/base/base_index.dart';

import 'i_login.dart';
import 'login_presenter.dart';
import 'user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends BaseState<LoginPage, ILoginView, LoginPresenter>
    implements ILoginView {
  GlobalKey _formKey = GlobalKey();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  String loginState = '未登录';

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('登录界面'),
      ),
      body: !isLoading
          ? _buildContainer()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _buildContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                focusNode: _userNameFocusNode,
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) => v.trim().length > 0 ? null : '请输入用户名',
              ),
              TextFormField(
                controller: _pwdController,
                focusNode: _pwdFocusNode,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入登录密码',
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                validator: (v) => v.trim().length > 5 ? null : '请输入至少6位密码',
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  loginState,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      //校验输入框
                      if ((_formKey.currentState as FormState).validate()) {
                        _login(_userNameController.text, _pwdController.text);
                      }
                    },
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  ///点击 登陆 按钮 触发登陆事件
  _login(String userName, String pwd) {
    //隐藏输入法
    _userNameFocusNode.unfocus();
    _pwdFocusNode.unfocus();
    presenter?.login(userName, pwd);
  }

  @override
  LoginPresenter initPresenter() => LoginPresenter();

  @override
  void onLoginFailed() {
    print("登陆失败！！！");
    setState(() {
      loginState = "登陆失败！！！";
    });
  }

  @override
  void onLoginSuccess(User user) {
    print("登陆成功 ${user.toString()}");

    setState(() {
      loginState = "登陆成功 ${user.toString()}";
    });
  }
}
