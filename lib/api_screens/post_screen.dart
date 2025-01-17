import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api/models/post_model/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  getAPI()async{
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getAPI(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      leading: CircleAvatar(child: Text(snapshot.data[index]['id'].toString())),
                      title: Text('Title :${snapshot.data[index]['title']}'),
                      subtitle: Text('SubTile :${snapshot.data[index]['body'].toString()}'),
                    );
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
