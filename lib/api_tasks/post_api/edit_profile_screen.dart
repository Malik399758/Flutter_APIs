import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  final picker = ImagePicker();
 /* Future<void> requestPermissions() async {
    // Request camera and storage permissions
    await [
      Permission.camera,
      Permission.photos, // For accessing gallery (storage)
    ].request();
  }*/

  // Pick Image from Gallery
  Future<void> getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      Navigator.pop(context); // Close the bottom sheet after picking an image
    } else {
      print('No Image is Picked');
    }
  }

  // Show BottomSheet
  Future<void> displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => getImage(ImageSource.gallery),
                    child: const Icon(Icons.photo, size: 60),
                  ),
                  Text('Select Image', style: GoogleFonts.poppins()),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => getImage(ImageSource.camera),
                    child: const Icon(Icons.camera_alt, size: 60),
                  ),
                  Text('Take Photo', style: GoogleFonts.poppins()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Text('Edit Profile',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: _image == null
                          ? Image.asset(
                        'assets/images/user_profile_image.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                          : Image.file(
                        _image!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        displayBottomSheet(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.mode_edit, size: 20),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Add photo',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: GoogleFonts.poppins()),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Email', style: GoogleFonts.poppins()),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Phone', style: GoogleFonts.poppins()),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Password', style: GoogleFonts.poppins()),
                  const SizedBox(height: 3),
                  TextFormField(
                    obscureText: true, // Hide password input
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      print('Profile updated!');
                      // Implement actual update logic here
                    },
                    child: Container(
                      width: double.infinity,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text('Update',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
