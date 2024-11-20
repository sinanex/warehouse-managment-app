import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/userdata.dart';
import 'package:storeit/widgets/widget.dart';
class EditUserPage extends StatefulWidget {
  String? name;
  String? email;
  String? password;
  dynamic image;

  EditUserPage({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  File? _image;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _passwordController = TextEditingController(text: widget.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: _image != null
                    ? Image.file(_image!)
                    : widget.image != null
                        ? Image.file(File(widget.image!))
                        : Image.asset('assets/images/profile.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: editImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 50),
            contextfeild(hindtext: 'name', controllertext: _nameController),
            contextfeild(hindtext: 'email', controllertext: _emailController),
            contextfeild(
                hindtext: 'password', controllertext: _passwordController),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    submitBtn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitBtn() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All field  required")),
      );
      return;
    }

    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString('user', name);
    await _pref.setString('pass', password);

    final data = UserData(
      name: name,
      email: email,
      password: password,
      image: _image?.path ?? " ",
    );
    updateProfile(data);
    Navigator.pop(context);
  }

  void editImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      print("No image selected");
    }
  }
}
