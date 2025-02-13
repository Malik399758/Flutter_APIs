
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smit_api/state_management/provider/provider_class/provider_number.dart';
import 'package:smit_api/state_management/provider/second_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderName())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // List<int> no = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderName>(
      builder: (context,provider,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider', style: GoogleFonts.poppins(fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            backgroundColor: Colors.teal,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Text(provider.no.last.toString(), style: GoogleFonts.poppins(
                        fontSize: 21, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                          itemCount: provider.no.length,
                          itemBuilder: (context, index) {
                            return Center(child: Text(provider.no[index].toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),));
                          }),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SecondScreen(value: provider.no)));
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Next',
                          style: GoogleFonts.poppins(color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              provider.add();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
              ),
              child: Icon(Icons.add, color: Colors.white,),
            ),
          ),
        );
      }
    );
  }
}

