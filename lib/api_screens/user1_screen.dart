import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api/models/user1_model/user1_model.dart';
class User1Screen extends StatefulWidget {
  const User1Screen({super.key});

  @override
  State<User1Screen> createState() => _User1ScreenState();
}

class _User1ScreenState extends State<User1Screen> {
  List<User1Model> list = [];
  
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Future<List<User1Model>>getApiUser1()async{
    final response = await http.get(url);
    if(response.statusCode == 200){
      final responseBody = jsonDecode(response.body);
      for(var value in responseBody){
        list.add(User1Model.fromMap(value));
      }
    }
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiUser1();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Users API'),
      ),
      body: list.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
        return ListTile(
          leading: CircleAvatar(
             backgroundColor: Colors.amber,
              child: Text(index.toString())),
          title: Text(list[index].name.toString()),
          subtitle: Text(list[index].phone.toString()),
          trailing: Text(list[index].address!.street.toString()),
        );
      })
    );
  }
}
