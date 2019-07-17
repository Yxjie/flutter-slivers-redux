
import 'package:flutter_list_rdux/mvp/base/base_index.dart';
import 'package:flutter_list_rdux/mvp/login/user.dart';

abstract class ILoginView extends IBaseView {
  void onLoginSuccess(User user);

  void onLoginFailed();
}

abstract class ILoginPresenter extends BasePresenter<ILoginView> {
  void login(String userName, String pwd) ;
}
