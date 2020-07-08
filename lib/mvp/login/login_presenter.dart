import 'i_login.dart';
import 'user.dart';

class LoginPresenter extends ILoginPresenter {
  ///模拟 登陆
  @override
  login(String userName, String pwd) async {
    view?.showLoading();
    Future<bool>.delayed(Duration(seconds: 3), () {
      return (userName == 'yxjie' && pwd == '123456');
    }).then((bool) {
      view?.hideLoading();
      if (bool) {
        view.onLoginSuccess(User(userName, pwd));
      } else {
        view.onLoginFailed();
      }
    });
  }
}
