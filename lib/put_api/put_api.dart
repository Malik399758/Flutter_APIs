import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class PutApi extends StatefulWidget {
  const PutApi({super.key});

  @override
  State<PutApi> createState() => _PutApiState();
}

class _PutApiState extends State<PutApi> {
  bool isLoading = false;
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  Future<void> putApi()async{
    try{
      setState(() {
        isLoading = true;
      });

      // url
      String url1 = 'https://reqres.in/api/users/2';
      var url = Uri.parse(url1);
      print('Url ---------------> $url');

      // header
      final header = {
        'content-Type' : 'application/json',
      };
      print('Header --------------------> $header');

      // body
      final requestBody = {
        'current password' : currentController.text,
        'new password' : newController.text,
        'confirm password' : confirmController.text,
      };
      print('Request Body ----------------------> $requestBody');

      // response
      final response = await http.put(url,headers: header,body: json.encode(requestBody));

      if(response.statusCode == 200 || response.statusCode == 201){
        final getResponse = json.decode(response.body);
        print('getResponse ----------------------> $getResponse');
        setState(() {
          isLoading = false;
        });
      }else{
        print('Error ----------->');
        isLoading = false;
      }

    }catch(error){
      print(error);
      isLoading = false;
    }




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Change Password',style: GoogleFonts.poppins(),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),

              child: TextFormField(
                controller: currentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Current Password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),

              child: TextFormField(
                controller: newController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' New Password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),

              child: TextFormField(
                controller: confirmController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Confirm Password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                String updatedAt =  "2025-02-02T13:40:18.124Z";
                if(currentController.text.isEmpty && newController.text.isEmpty && confirmController.text.isEmpty){
                  Fluttertoast.showToast(
                    msg: 'Please fill the above textformfield',
                    gravity:ToastGravity.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                else if(newController.text.isEmpty && confirmController.text.isEmpty){
                  Fluttertoast.showToast(
                    msg: 'Please enter the new password',
                    gravity:ToastGravity.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                else if(updatedAt.isNotEmpty){
                  Fluttertoast.showToast(
                    msg: 'Update Successfully',
                    gravity:ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }else{
                  Fluttertoast.showToast(
                    msg: 'Sometime went wrong',
                    gravity:ToastGravity.CENTER,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Update Successfully')));
                putApi();
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(" Change Password",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
