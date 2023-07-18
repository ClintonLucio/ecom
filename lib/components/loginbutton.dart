import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key,
  required this.btntext,
  required this.onPressed
  });

  final String btntext;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:50,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight:Radius.circular(50),
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50) ),
          
        ),
        
        child: TextButton(onPressed: onPressed, 
        child: Text(btntext, style: const TextStyle(color: Colors.white,
       fontWeight: FontWeight.bold, fontSize: 20),)),
      ),

    );
  }
}