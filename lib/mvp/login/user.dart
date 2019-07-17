class User {
  String name;
  String pwd;

  User(this.name, this.pwd);

  @override
  String toString() {
    return "$name : $pwd";
  }
}
