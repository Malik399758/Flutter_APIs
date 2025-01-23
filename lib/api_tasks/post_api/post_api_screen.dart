
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_api/api_tasks/post_api/logout_screen.dart';
import 'package:http/http.dart' as http;

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> postApi({required String email, required String password})async{
    try{
      // Url
      final url = Uri.parse('https://reqres.in/api/login');
      print('url ---------$url');
      // body
      final body = {
        'email' : email,
        'password' : password
      };
      print('Body ---------$body');

      // Header

      final headers = {
        'Content-Type' : 'application/json'
      };

      // Response

      Response response = await http.post(url,headers: headers,body:json.encode(body));
      print('Response --------------- ${response.body}');
      if(response.statusCode == 200){
        print('Yes the status is 200');
      }else{
        print('Sorry the status is wrong');
      }

    }catch(e){
      print('Error -----> $e');
    }

  }

  // Set data

 // List<String> list = [];
  void SetData()async{
    String email = emailController.text;
    String password = passwordController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    print('Successfully ------------->$email');
    print('Successfully ------------->$password');
    if(email.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill the above form')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data added')));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                        width: 60,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )
                        ),
                        child: ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/login_screen_pic.jpg',fit: BoxFit.cover,))),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      postApi(email: emailController.text.toString(), password: passwordController.text.toString());
                    },
                      child: Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 5,),
                  Text("Login to access your account and explore\nall the exiting features we've crafted for you"),
                  const SizedBox(height: 30,),
                  Text('Your Email'),
                  SizedBox(height: 3,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  const SizedBox(height: 13,),
                  const Text('Your Password'),
                  const SizedBox(height: 3,),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 3,),
                  const Align(
                    alignment: FractionalOffset.topRight,
                      child: Text('Forgot password?')),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: ()async{
                      if(emailController.text.isEmpty || passwordController.text.isEmpty){

                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutScreen()));
                      }

                      // postApi(email: emailController.text, password: passwordController.text);
                      SetData();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black
                      ),
                      child: Center(child: Text('Login',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: Divider()),
                      SizedBox(width: 7,),
                      Text('or',style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 7,),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: ()async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      String name = 'Yaseen Malik';
                      prefs.setString('name', name);
                      print('Set Data -----------> ${name.toString()}');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Set data')));
                    },
                    child: Center(
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Login with',style: TextStyle(color: Colors.black)),
                          TextSpan(text: ' Mobile No.',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                        ]
                      )),
                    ),
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: ()async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      final data = prefs.getString('name');
                      print('Result ------> ${data.toString()}');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Get data')));
                    },
                    child: Center(
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "Don't have an account?",style: TextStyle(color: Colors.black)),
                          TextSpan(text: ' Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                        ]
                      )),
                    ),
                  )
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
