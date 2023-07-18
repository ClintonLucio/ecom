import 'package:flutter/material.dart';

class SearchPane extends StatelessWidget {
  const SearchPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            height: 50,
            width: 360,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                   
                   prefixIcon: Icon(Icons.search, color: Colors.white,),
                   hintText: 'Search...',
                       
                  hintStyle: TextStyle(color: Colors.white),
                  
                 border: OutlineInputBorder(
                  
                  borderSide: BorderSide.none,
                  
                 )
                ),
                
              ),
            ),
          ),
     
        ],
    );
  }
}