import 'package:flutter/material.dart';

import '../models/constants.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  //create categories list 
  List<String> categories = ["Addis", "Nikkies", "Jordans", "Puma","underarmor"];
  //create a selected index 
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) =>
       GestureDetector(
        onTap: (){
          setState(() {
            selectedIndex = index;
          });
        },
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: padding),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(categories[index],style: const TextStyle(color: Colors.white, fontSize: 17.0),
                   ),
              Container(
                color: selectedIndex == index? Colors.lightGreen : Colors.lightGreen,
                height: 1,
          
              )
             ],
           ),
         ),
       )
      ),
      itemCount: categories.length,),
    );
  }
}