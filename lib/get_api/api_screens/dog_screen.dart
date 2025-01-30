import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smit_api/models/dogs_model/dog_model.dart';


class DogScreen extends StatefulWidget {
  const DogScreen({super.key});

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  List<DogModel> list = [];

   var url = Uri.parse('https://www.freetestapi.com/api/v1/dogs');
   Future<List<DogModel>> getDogApi()async{
     final response = await http.get(url);
     if(response.statusCode == 200){
       final responseBody = jsonDecode(response.body);
       for(var data in responseBody){
         list.add(DogModel.fromMap(data));
       }
     }
     return list;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Dogs API',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getDogApi(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              {
                return Center(child: CircularProgressIndicator());
              }
            }else if(snapshot.hasError){
              return Center(child: Text('Error ${snapshot.error.toString()}'));
            }
            else{
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Colors.green,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID : ${list[index].id.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Name  : ${list[index].name.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('BreedGroup : ${list[index].breedGroup.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Size  : ${list[index].size.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Lifespan  : ${list[index].lifespan.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Origin  : ${list[index].origin.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Temperament  : ${list[index].temperament.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Color  : ${list[index].colors.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Description  : ${list[index].description.toString()}',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                      ),
                    );
                  });

            }
          }),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){
          getDogApi();
        },
        child: Icon(CupertinoIcons.add),
      ),*/
    );
  }
}
