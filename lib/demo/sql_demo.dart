import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:toast/toast.dart';

///Flutter 数据库使用

enum ActionType { ADD, DELETE, UPDATE, QUERY }

class SQLDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SQLDemoState();
}

class _SQLDemoState extends State<SQLDemo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String _msgData = '暂无数据';
  final String _dbName = "stu.db"; //数据库表名
  //创建学生表
  final String _createdDB =
      'CREATE TABLE student_table(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)';
  int dbVersion = 1;

  @override
  void initState() {
    super.initState();
    DBUtil.createDB(_dbName, dbVersion, _createdDB);

    String sql = 'SELECT * FROM student_table';
    DBUtil.query(_dbName, sql).then((list) {
      setState(() {
        _msgData = '数据库内容：\n${list.toString()}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQL使用'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "默认创建数据库和一张学生表，如下可对表的姓名、年龄进行增删改查操作：",
                style: TextStyle(fontSize: 14, color: Color(0xff666666)),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            _getInputView('姓名', _nameController),
            Padding(padding: const EdgeInsets.only(top: 10)),
            _getInputView('年龄', _ageController),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _nameController.clear();
                    _ageController.clear();
                  },
                  child: Text(
                    "清空",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                _getButton('插入数据', ActionType.ADD, context),
                _getButton('删除数据', ActionType.DELETE, context),
                _getButton('更新数据', ActionType.UPDATE, context),
                _getButton('查询数据', ActionType.QUERY, context),
              ],
            ),
            Text(
              _msgData,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  ///判断输入框是否 输入内容
  _isEditEmpty(TextEditingController controller) =>
      controller.text == null || controller.text.isEmpty;

  _getInputView(String hint, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xff88888888)),
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff88888888)),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
    );
  }

  _getButton(String buttonName, ActionType action, BuildContext context) {
    return ElevatedButton(
      onPressed: () => _getActionCallback(action, context),
      child: Text(
        buttonName,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }

  ///处理对应 数据库操作
  _getActionCallback(ActionType action, BuildContext context) {
    if (action != ActionType.QUERY && action != ActionType.DELETE) {
      if (_isEditEmpty(_nameController)) {
        Toast.show("请输入姓名", context);
        return;
      }
      if (_isEditEmpty(_ageController)) {
        Toast.show("请输入年龄", context);
        return;
      }
    }

    switch (action) {
      case ActionType.ADD:
        String sql =
            "INSERT INTO student_table(name,age) VALUES('${_nameController.text}','${_ageController.text}')";
        DBUtil.add(_dbName, sql);
        continue QUERY;
        break;
      case ActionType.DELETE:
        String sql = "DELETE FROM student_table"; //无条件删除学生表数据
        DBUtil.delete(_dbName, sql);
        continue QUERY;
        break;
      case ActionType.UPDATE:
        String sql = "UPDATE student_table SET name =? WHERE id = ?";
        DBUtil.update(_dbName, sql, [_nameController.text, 1]);
        continue QUERY;
        break;
      //todo Demo为了演示偷懒写法，正式项目switch标签禁止使用！！！！
      QUERY:
      case ActionType.QUERY:
        String sql = 'SELECT * FROM student_table';
        DBUtil.query(_dbName, sql).then((list) {
          setState(() {
            _msgData = '数据库内容：\n${list.toString()}';
          });
        });

        break;
    }
  }
}
