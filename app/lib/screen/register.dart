import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/userdata.dart';
import 'package:storeit/screen/bottomNavigation.dart';
import 'package:storeit/screen/login.dart';
import 'package:storeit/screen/profile.dart';
import 'package:storeit/services/auth/auth_services.dart';
import 'package:storeit/widgets/widget.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  bool passwordHide = true;
  IconData icon = Iconsax.eye_slash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Let's create account",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              contextfeild(
                  hindtext: 'username', controllertext: nameController),
              const SizedBox(
                height: 20,
              ),
              contextfeild(
                  hindtext: 'Email Address', controllertext: emailController),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passwordHide,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(icon),
                        onPressed: () {
                          setState(() {
                            passwordHide = !passwordHide;
                            if (passwordHide == true) {
                              icon = Iconsax.eye_slash;
                            } else {
                              icon = Iconsax.eye_slash5;
                            }
                          });
                        },
                      ),
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 360,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          signupBtn();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already  have an account?  "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const LoginPage()));
                    },
                    child: const Text(
                      'sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signupBtn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final storedName = pref.getString('user');
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required.")),
      );
      return;
    }

     AuthServices().registerUser(name: name, email: email, password: password);
      // pref.setBool(logkey, true);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const NavigationPage(initialState: 0,)));
    }
  }
