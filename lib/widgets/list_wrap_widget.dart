import 'package:flutter/material.dart';

///流式布局Widget 支持单选以及多选
class ListWrapWidget<T> extends StatefulWidget {
  final List<T> list;
  final String title;
  final ItemWrapWidget<T> itemChild;
  final String subTitle;
  final TextStyle titleStyle, subTitleStyle;
  final bool multiSelected;
  final SelectedCall selectedCall;

  ListWrapWidget(
      {@required this.list,
      @required this.itemChild,
      this.title = '',
      this.subTitle = '',
      this.multiSelected = false,
      this.titleStyle,
        this.selectedCall,
      this.subTitleStyle})
      : assert(list != null && itemChild != null);

  @override
  State<StatefulWidget> createState() => _ListWrapState();
}

class _ListWrapState<T> extends State<ListWrapWidget> {
  //标题样式
  final titleStyle = TextStyle(color: Color(0xFF4C505B), fontSize: 14);
  final subTitleStyle = TextStyle(color: Color(0xFF757993), fontSize: 12);
  var selectedSet = Set<int>()..add(0);

  @override
  Widget build(BuildContext context) {
    var titleBar = Row(
      children: <Widget>[
        Text(
          widget.title,
          style: widget.titleStyle != null ? widget.titleStyle : titleStyle,
        ),
        Text(
          widget.subTitle,
          style: widget.subTitleStyle != null
              ? widget.subTitleStyle
              : subTitleStyle,
        )
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleBar,
        Wrap(
          children: widget.list.map((value) {
            return GestureDetector(
              onTap: () {
                _changeSet(_indexFromList(value));
                widget.selectedCall(_getSelectedList());
              },
              child: widget.itemChild.buildContainer(
                  value, selectedSet.contains(_indexFromList(value))),
            );
          }).toList(),
        ),
      ],
    );
  }


  ///获取选中数据
  List<T> _getSelectedList<T>(){
    var list=[];
    for (int i = 0; i < widget.list.length; i++) {
      if(selectedSet.contains(i)){
        list.add(widget.list[i]);
      }
    }
    return list;
  }

  int _indexFromList<T>(T t) {
    return widget.list.indexOf(t);
  }

  ///改变选中index
  _changeSet(int index) {
    if (selectedSet.contains(index)) {
        if(selectedSet.length ==1){
          return;
        }
        selectedSet.remove(index);
    } else {
      if (widget.multiSelected) {
        //多选状态
        selectedSet.add(index);
      } else {
        //单选状态
        selectedSet.clear();
        selectedSet.add(index);
      }
    }
    setState(() {
      //widget刷新
    });
  }
}

///item Widget 抽象类
abstract class ItemWrapWidget<T> extends StatelessWidget {
  final T bean;
  final bool isSelected;

  ItemWrapWidget({this.bean, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return buildContainer(bean, isSelected);
  }

  Widget buildContainer(T bean, bool isSelected);
}

typedef SelectedCall = void Function(dynamic);