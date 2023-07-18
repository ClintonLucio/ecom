import 'package:ecom/getstarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  //first and foremost create an animation controller
  
  //now let's go ahead and dispose the animationcontroller

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
         body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                  margin:const EdgeInsets.only( top: 80, left: 10),
                  child: 
                  Animate(
                  effects: const [FadeEffect(duration: Duration(seconds: 2)), ScaleEffect()],
                  child: const Image(image: AssetImage('assets/images/snk.png'))
                  ),
               ),
               //get started widget
              Container(  
                margin: const EdgeInsets.all(20),
               
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),

                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)
                  )
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetStartedWidget(
                    text: 'LUCIO\'S SNEAKER HUB',
                    details: 'We are here to give you all the types of sneakers you need here in Ghana. Just link up',
                    
                     ),
                     
                  ],
                ),
              )
             
            ],
           ),
         ),
    );
  }
}

