import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:ecom/models/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';



class ProductCard extends StatelessWidget {
  final Product product;
   final Function press;
  const ProductCard({super.key, required this.product, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        press;
      },
      child: Animate(
            effects: const [FadeEffect(duration: Duration(seconds: 2))],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    // height:180,
                     width:160 ,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Image.asset(product.image),
                  ),
                ),
                Text(product.title, style: const TextStyle(color: detailsColor, fontSize: 20.0),),
               Text("¢${product.price}", style: const TextStyle(color: detailsColor, fontWeight: FontWeight.bold),)
                
    
              ],
            ),
          ),
    );
  }
}