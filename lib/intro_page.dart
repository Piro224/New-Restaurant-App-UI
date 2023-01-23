import 'package:flutter/material.dart';
import 'package:new_restaurant_app_ui/menu_card.dart';
import 'package:new_restaurant_app_ui/product_model.dart';

class IntroPage extends StatelessWidget {
  final ProductModel productModel;
  const IntroPage({
    super.key,
    required this.productModel,
  });

  // ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Some texts about whats on the menu
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Our Fresh Menu',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //and an expanded listview showing the products
          Expanded(
            child: GridView.builder(
              itemCount: productModel.demo.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.3,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return MenuCard(
                  itemName: productModel.demo[index][0],
                  price: productModel.demo[index][1],
                  imagePath: productModel.demo[index][2],
                  description: productModel.demo[index][3],
                  productModel: productModel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
