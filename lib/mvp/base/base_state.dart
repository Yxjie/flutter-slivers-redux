import 'package:flutter/material.dart';

import 'base_presenter.dart';
import 'i_base_view.dart';

abstract class BaseState<T extends StatefulWidget, V extends IBaseView,
    P extends BasePresenter<V>> extends State<T> implements IBaseView {
  P presenter;

  bool isLoading = false;

  P initPresenter();

  Widget buildView(BuildContext context);

  void loadData() {}

  @override
  void initState() {
    super.initState();
    presenter = initPresenter();
    presenter?.onAttachView(this);
    loadData();
  }


  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }

  @override
  void dispose() {
    super.dispose();
    if(presenter !=null){
      presenter.onDetachView();
      presenter=null;
    }
  }
}
