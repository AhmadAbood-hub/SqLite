class User {
  int id;
  String username;
  String password;
  String city;
  int age;

  User(this.username, this.password, this.city, this.age);

  User.map(dynamic obj) {
    this.id = obj['id'];
    this.username = obj['username'];
    this.password = obj['password'];
    this.city = obj['city'];
    this.age = obj['age'];
  }

  int get _id => id;

  String get _username => username;

  String get _password => password;

  String get _city => city;

  int get _age => age;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    map['city'] = _city;
    map['age'] = _age;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.username = map['username'];
    this.password = map['password'];
    this.city = map['city'];
    this.age = map['age'];
  }
}
