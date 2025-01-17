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
  List<PostModel> _list = [];
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

 Future<List<PostModel>> getAPI()async{
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    //return responseBody;
   for(var each in responseBody){
     _list.add(PostModel.fromMap(each));
   }
   return _list;
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
              return ListView.separated(
                separatorBuilder: (context,index){
                  return Divider();
                },
                itemCount: _list.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                          child: Text(_list[index].id.toString(),style: TextStyle(
                            color: Colors.white
                          ),),),
                      title: Text(_list[index].title.toString()),
                      subtitle: Text(_list[index].body.toString(),),
                    );
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
