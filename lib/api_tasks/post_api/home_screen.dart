import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_api/api_tasks/post_api/edit_profile_screen.dart';
import 'package:smit_api/api_tasks/post_api/post_api_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logoutShow(BuildContext context)async{
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title:Text('Logout',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
            content:Text('Do you want to logout this account?',style: GoogleFonts.poppins(fontSize: 16,),),
            actions: [
              ElevatedButton(onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                print('user logged out the shared preferences cleared!');
                // retrieve
                String? userToken = await prefs.getString('token');
                print('Stored user token after logout  $userToken');
                if(userToken == null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostApiScreen()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout Successfully!')));
                }
             }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('NO'))
            ]
            ,
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
              },
                child: Icon(Icons.person,size: 30,)),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: (){
                logoutShow(context);
              },
                child: Icon(Icons.logout,size: 25,)),
          )
        ],
        title: Text('Home Page',style: GoogleFonts.poppins(),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to HomeScreen',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.grey,
                  )
                ),
                child: Image.asset('assets/images/login_home_screen.png')),

          ],
        ),
      ),
    );
  }
}
