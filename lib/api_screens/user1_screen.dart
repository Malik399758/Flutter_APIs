import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class User1Screen extends StatefulWidget {
  const User1Screen({super.key});

  @override
  State<User1Screen> createState() => _User1ScreenState();
}

class _User1ScreenState extends State<User1Screen> {
  
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  getApiUser1()async{
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    return responseBody;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Users API'),
      ),
      body: FutureBuilder(
          future: getApiUser1(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: Text(index.toString()),
                      title: Text(snapshot.data[index]['name'].toString()),
                      subtitle: Text(snapshot.data[index]['username'].toString()),
                      trailing: Text(snapshot.data[index]['company']['name'].toString()),
                    );
                  });
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
