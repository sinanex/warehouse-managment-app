import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeit/screen/bottomNavigation.dart';
import 'package:storeit/screen/register.dart';
import 'package:storeit/widgets/widget.dart';


class LoginPage extends StatefulWidget {
 const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
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
                  "Hello Again!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Center(
                child: Text(
                  "Welcome back you've been missed",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 100,),
             contextfeild(hindtext: 'username',controllertext: nameController),
              const SizedBox(height: 30,),
             
               Container(
                decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passwordHide,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: IconButton(icon:  Icon(icon),onPressed: (){
                        setState(() {
                          passwordHide = !passwordHide;
                          if(passwordHide == true){
                             icon = Iconsax.eye_slash;
                          }else{
                            icon = Iconsax.eye_slash5;
                          }
                        });
                      },),
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 360,
                    height: 65,
                    child: ElevatedButton(onPressed: (){
                      loginBtn();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ), child: const Text("Sign In",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),),
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                const SizedBox(width: 80,),
                const Text("don't have an account?  "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const RegisterPage()));
                  },
                  child: const Text('sign up',style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> loginBtn() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

    final storedName =  pref.getString('user');
    final storedPass =  pref.getString('pass');
    final name = nameController.text.trim();
    final password = passwordController.text.trim();

    if(storedName==name&&storedPass==password){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (con)=> NavigationPage(initialState: 0,)));
    }else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid password or username")));
    }
}


}