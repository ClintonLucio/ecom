import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key,
  required this.btntext,
  required this.onPressed
  });

  final String btntext;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:60,
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight:Radius.circular(50),
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50) ),
          
        ),
        
        child: TextButton(onPressed: onPressed, 
        child: Text(btntext, style: const TextStyle(color: Colors.white),)),
      ),

    );
  }
}