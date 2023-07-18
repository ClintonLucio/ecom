import 'package:ecom/models/constants.dart';
import 'package:flutter/material.dart';

import '../components/body.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: newheader(),
      body: const Body(),
    );
  }

  AppBar newheader() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back, color: Colors.white,)),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart, color: Colors.white,)),
        const SizedBox(width: padding/2,)

      ],
    );
  }
}