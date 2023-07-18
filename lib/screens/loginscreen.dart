import 'package:ecom/screens/marketscreen.dart';
import 'package:ecom/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/loginbutton.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController emailController = TextEditingController();

 final TextEditingController passwordController = TextEditingController();

 //..create a loading bool
 bool loading = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
      
        //comparing if loading is true or not  
         loading?const CircularProgressIndicator(color: Colors.lightGreen,): LoginButton(btntext: 'LOGIN', onPressed: () async{
          //if button is clicked 
          setState(() {
            loading = true;
          });
            if(emailController.text=="" || passwordController.text==""){
              ScaffoldMessenger.of(context) .showSnackBar(const SnackBar(content: Text('All fields are required', style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),), backgroundColor: Colors.lightGreen,));
            }
            else{
              User? result = await AuthServices().login(emailController.text, passwordController.text,context);
              if(result != null){
                print('success');
                Get.to(const MarketScreen(),);
                
              }
            }
           //clear circular 
           setState(() {
             loading = false;
           });
          }),    
        
     
        ],
      ),
      
      )
    );
  }
}