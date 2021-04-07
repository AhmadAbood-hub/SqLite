import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sql_issa/model/user.dart';
import 'utils/database_helper.dart';

List myUsers;

void main() async {
  var db = new DatabaseHelper();
  await db.saveUser(new User("Ahmad", '123456', "Aleppo", 25));

  int sumUsers = await db.getCount();
  print('Total: $sumUsers');

  User x = await db.getUser(1);
  print('Username: ${x.username}');

  myUsers = await db.getAllUsers();

  for (int i = 0; i < myUsers.length; i++) {
    User user = User.map(myUsers[i]);
    print('username: ${user.username}');
  }

  int deleteUser = await db.deleteUser(1);

  User y = await User.fromMap({
    "username": 'Ahmad',
    "password": '123456',
    "city": 'Aleppo',
    "id": 1,
    "age": 23
  });

  await db.updateUser(y);

  runApp(new MaterialApp(
    home: new Home(),
    title: 'Sql',
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite'),
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView.builder(
          itemCount: myUsers.length,
          itemBuilder: (_, int position) {
            return new Card(
              child: new ListTile(
                leading: new Icon(Icons.person,color: Colors.white,size:33.0 ,),
                title: new Text('${User.fromMap(myUsers[position]).username}'),
                subtitle: new Text('${User.fromMap(myUsers[position]).city}'),
                onTap: () =>
                    debugPrint('${User.fromMap(myUsers[position]).age}'),
              ),
              color: Colors.amber,
              elevation: 3.0,
            );
          }),
    );
  }
}
