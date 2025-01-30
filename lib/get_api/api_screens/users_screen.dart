import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api/models/user_model/user_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  List<UserModel> list = [];

  var url = Uri.parse('https://dummyjson.com/users');
  Future<List<UserModel>>getUserApi()async{
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    // print(responseBody);
    if(response.statusCode == 200){
      for(var data in responseBody){
       list.add(UserModel.fromMap(data));
      }
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future:getUserApi(),
          builder: (context,snapshot){
            if(snapshot.hasError){
             return Center(child: Text('Error ${snapshot.error}'));
            }
            else if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          Text(index.toString()),
                          // Text(list[index].users!.first.toString()),
                        ],
                      ),
                    );
                  });
            }

          }),
     /* floatingActionButton: FloatingActionButton(
        onPressed: (){
          getUserApi();
        },
        child: Icon(CupertinoIcons.add),
      ),*/
    );
  }
}
