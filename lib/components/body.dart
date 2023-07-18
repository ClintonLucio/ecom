import 'package:ecom/components/product_card.dart';
import 'package:ecom/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


import '../models/product.dart' ;
import '../screens/Details/detailscreen.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Animate(
            effects: const [FadeEffect(duration: Duration(seconds: 2))],
            child: const Text("Welcome", style: TextStyle(fontSize: 30.0,
             color: Colors.white,
             fontWeight: FontWeight.bold),),
          ),
        ),
        const  Categories(),
        const SizedBox(height: 10.0,),
        //display product cards
        Expanded(child:
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: padding),
           child: GridView.builder(gridDelegate: 
                 const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 childAspectRatio: 0.75,
                 crossAxisSpacing: padding,
                 mainAxisSpacing: padding),
            itemBuilder: ((context, index) =>  ProductCard(
              product: products[index] ,
              press:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                  product: products[index]
                )));
              }
            )),
            itemCount: products.length ,),
         )
         )
      ],
    );
  }
}

