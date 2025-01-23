import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_api/api_tasks/post_api/home_screen.dart';
import 'package:smit_api/api_tasks/post_api/post_api_screen.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Column(
        children: [
          BuildLogout()
        ],
      )
    );
  }
}
class BuildLogout extends StatefulWidget {
  const BuildLogout({super.key});

  @override
  State<BuildLogout> createState() => _BuildLogoutState();
}

class _BuildLogoutState extends State<BuildLogout> {
  String data1 = '';
  String data2 = '';
  getData()async{
    setState(() {
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data1 = prefs.getString('email') ?? 'No email';
    print('Email -------------->$data1');
    data2 = prefs.getString('password') ?? 'No Password';
    print('Password -------------->$data2');
  }

  Future<void> logout(){
    return showDialog(
        context: context,
        builder: (BuildContext contex){
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Do you want to logout this account?'),
            actions: [
              ElevatedButton(onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout Successfully')));
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostApiScreen()));
              }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Center(
                child: Container(
                            margin: const EdgeInsets.only(top: 60),
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
            ),
            const SizedBox(height: 20,),
            const Text('Your Info',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            const Padding(
              padding:  EdgeInsets.only(left: 5),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Show your information in this screen through\n'),
                    TextSpan(
                      text: 'Shared Preferences',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: () async{
                logout();
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: Text('Logout?',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),)),
            ),
            SizedBox(height: 3,),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: Center(child: Text(data1.toString())),
            ),
            const SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
              child: Center(child: Text(data2.toString())),
            ),
            const SizedBox(height: 60,),
            GestureDetector(
              onTap: (){
                getData();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully')));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Show your information here',style: TextStyle(color: Colors.white),)),

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
            const SizedBox(height: 80,),
            Center(
              child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Don't have an account?",style: TextStyle(color: Colors.black)),
                    TextSpan(text: ' Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                  ]
              )),
            ),
          ],
        ),
      ),
    );
  }

}
