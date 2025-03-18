import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/widgets/list_wrap_widget.dart';

class ListWrapTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListWrapState();
}

class _ListWrapState extends State<ListWrapTest> {
  final list = [
    'iphone',
    'AirPods Pro',
    'iWatch',
    'iPad Air',
    'iPad Pro',
    'Mac',
    'MacBook Pro'
  ];

  bool multiSelected = false;
  String result;

  GlobalKey wrapKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式多选Widget测试'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('选取数据：$result'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                multiSelected = !multiSelected;
                (wrapKey.currentState as ListWrapState).reset();
              });
            },
            child: Text(multiSelected ? '多选' : '单选'),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFF0000), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: ListWrapWidget<String>(
              key: wrapKey,
              list: list,
              itemChild: ItemWidget(),
              title: '苹果全家桶',
              subTitle: '(效果如何)',
              multiSelected: multiSelected,
              selectedCall: (list) {
                setState(() {
                  print('获取内容 = ${(list as List).length}');
                  result = list.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

///自定义流式item样式
class ItemWidget extends ItemWrapWidget<String> {
  @override
  Widget buildContainer(String bean, bool isSelected) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      color: isSelected ? Colors.blue : Colors.white,
      child: Text(bean),
    );
  }
}
