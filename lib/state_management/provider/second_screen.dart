import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smit_api/state_management/provider/provider_class/provider_number.dart';

class SecondScreen extends StatefulWidget {
  final List<int> value;
  const SecondScreen({super.key, required this.value});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderName>(
      builder: (context,provider,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider Second Screen', style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            backgroundColor: Colors.teal,
          ),
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Text(provider.no.last.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 21, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: provider.no.length,
                          itemBuilder: (context, index) {
                            return Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.no[index].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w600),),
                            ));
                          }),
                    ),
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
