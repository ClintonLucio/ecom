import 'package:flutter/material.dart';

class Product{
 final String image, title, description;
 final int price, size, id;
 final Color color;
 //create constructors for them
 Product(this.title,this.image,this.description,this.price,this.size,this.id,this.color);
}
//create a list of product and details
List<Product> products = [
 Product('Air Jordan',
  'assets/images/pi1.png', 
  'Affordable', 500, 12, 1, Colors.lightGreen),
 Product('Air Jordan 4',
  'assets/images/pi2.png', 
  'Affordable', 700, 15, 1, Colors.lightGreen), 
   Product('Travis Scott',
  'assets/images/img01.png', 
  'Affordable', 800, 12, 1, Colors.lightGreen),
   Product('Vans',
  'assets/images/vans.png', 
  'Affordable', 800, 12, 1, Colors.lightGreen),
  Product('Gym1',
  'assets/images/spt.png', 
  'Affordable', 800, 12, 1, Colors.lightGreen),
  Product('Gym2',
  'assets/images/rr.png', 
  'Affordable', 800, 12, 1, Colors.lightGreen),
  
];

