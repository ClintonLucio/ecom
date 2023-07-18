import 'package:ecom/components/getstartedbtn.dart';
import 'package:ecom/screens/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key,
  required this.details,
  required this.text,
  
  
  });
final String details;
final String text;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.lightGreen,
         margin: const EdgeInsets.all(20),
          child:   Column(
           children: [
              Text(text, style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
              Animate(
              effects: const [FadeEffect(
                duration: Duration(seconds: 2)
              ), ScaleEffect()],
              child: Text(details)),
              const SizedBox(
                height: 15,
              ),
              GetStarted(btntext: 'GET STARTED',
              onPressed: (){
                 Get.to( RegistrationScreen(),
                 transition: Transition.rightToLeftWithFade,
                 duration: const Duration(seconds: 3),
                 );
              })
           ],
          ),
      ),
    );
  }
}