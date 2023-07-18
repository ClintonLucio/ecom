import 'package:ecom/components/signupbutton.dart';
import 'package:ecom/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class RegistrationScreen extends StatefulWidget {  
const RegistrationScreen({super.key});
 @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
//create controllers for the input fields
final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

final TextEditingController confirmpasswordController = TextEditingController();

bool loading = false;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [ 
                Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                ),
                child:  TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                     
                     prefixIcon: Icon(Icons.alternate_email, color: Colors.white,),
                     hintText: 'Enter your email address',
                         
                    hintStyle: TextStyle(color: Colors.white),
                    
                   border: OutlineInputBorder(
                    
                    borderSide: BorderSide.none,
                    
                   )
                  ),
                  
                ),
              ),
               const SizedBox(
                      height: 30,
                    ),
                       Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                ),
                child:  TextField(
                      obscureText: true,
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                     
                     prefixIcon: Icon(Icons.lock, color: Colors.white,),
                     hintText: 'Enter your Password',
                         
                    hintStyle: TextStyle(color: Colors.white),
                    
                   border: OutlineInputBorder(
                    
                    borderSide: BorderSide.none,
                    
                   )
                  ),
                  
                ),
              ),
              const SizedBox(
                      height: 30,
                    ),
               Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                ),
                child:  TextField(
                      obscureText: true,
                      controller: confirmpasswordController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                     
                     prefixIcon: Icon(Icons.approval_rounded, color: Colors.white,),
                     hintText: 'Confirm your Password',
                         
                    hintStyle: TextStyle(color: Colors.white),
                    
                   border: OutlineInputBorder(
                    
                    borderSide: BorderSide.none,
                    
                   )
                  ),
                  
                ),
              ),
                
               const SizedBox(
                      height: 30,
                    ),
              loading? const CircularProgressIndicator(color: Colors.lightGreen,):  RegisButton(btntext: 'SUBMIT', onPressed: () async{
                    setState(() {
                      loading = true;
                    });
                    if(emailController.text=="" || passwordController.text==""){
                        ScaffoldMessenger.of(context) .showSnackBar(const SnackBar(content: Text('All fields are required', style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),), backgroundColor: Colors.lightGreen,));
                    }
                   else if(passwordController.text != confirmpasswordController.text){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords don\'t match', style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold
                    ))));

                   }
                   else{
                    User? result = await AuthServices().register(emailController.text, passwordController.text,context);
                      if(result !=null){
                        print("Success");
                        print(result.email);
                       
                      }
                   }
                   //..clear circularindicator
                   setState(() {
                     loading = false;
                   });
                }),    
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const LoginScreen()));
              }, child: const Text("Already have an account? Login here", style: 
              TextStyle(color: Colors.white)
              ,)),
              const Divider(),
             const SizedBox(
                height: 20,
              ),
        loading? const CircularProgressIndicator(color: Colors.lightGreen,):  SignInButton(Buttons.Google,
           onPressed: () async{
            setState(() {
              loading = true;
            });
              //let's push all sign in codes right here
        
              await AuthServices().signInWithGoogle();
            setState(() {
              loading = false;
            });
            })
              ],
            ),
          ),
          
          ),
        ),
      )
    );
  }
}