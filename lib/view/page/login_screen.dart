import 'package:flutter/material.dart';
import '../../controller/data/local/shared.dart';
import '../../utilities/enums.dart';
import 'home_screen.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController
    (text: MyCache.getString(key: MyCacheKeys.email));

  var passwordController =TextEditingController
    (text: MyCache.getString(key: MyCacheKeys.password));

  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const  Text("Login",style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),),  const SizedBox(
                  height: 50,
                ),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty ){
                      return "Email must not be empty";
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-z]").
                    hasMatch(value)){
                      return "please enter valid mail";
                    }
                    else {return null;}
                  },

                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email),
                    labelText: "email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green,

                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value){
                    passwordController.text= value! ;
                    if(value!.length <10){
                      return "please enter 10 char";
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.remove_red_eye_outlined)),
                    labelText: "password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green,

                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
                const   SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      print("done");
                    },
                    child: const Text("FoegetPassword",style: TextStyle(
                        fontSize: 15,
                        color: Colors.teal
                    ),),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(onPressed: ()
                    {print("submit");}, child: const Text("ForegetPassword?"))),
                const   SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      MyCache.putString(key: MyCacheKeys.email, value: emailController.text);
                      MyCache.putString(key: MyCacheKeys.password, value: passwordController.text);

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      const HomeScreen()));
                    }
                    // if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    // }
                    //
                    print(emailController.text);
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    elevation: 0.0,

                  ),
                      child: const Text("Login")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
