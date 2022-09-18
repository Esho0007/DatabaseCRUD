import 'package:database_intro/models/user.dart';
import 'package:database_intro/utils/database_help.dart';
import 'package:flutter/material.dart';

import 'utils/my_database_helper.dart';




void main () async{
  runApp( const MaterialApp(


    title: "Database",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    insertUser();
    super.initState();
  }

  void insertUser() async {
    DatabaseHelper _dbHelper = DatabaseHelper.instance;
    int savedUser = await _dbHelper.saveUser(User(1,"Aish","Olaleye"));
    int saved2User = await _dbHelper.saveUser(User(2,"Aishhhh","Olaluuueye"));
    if(savedUser ==  1){
      print("User created successfully!!!");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      )
    );
  }
}
