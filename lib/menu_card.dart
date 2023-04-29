import 'package:flutter/material.dart';
import 'package:new_restaurant_app_ui/description.dart';
import 'package:new_restaurant_app_ui/product_model.dart';

class MenuCard extends StatefulWidget {
  final String itemName, price, imagePath, description;
  final ProductModel productModel;

  const MenuCard({
    super.key,
    required this.itemName,
    required this.price,
    required this.imagePath,
    required this.productModel,
    required this.description,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  bool btntapped = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MenuDescription(
              imagePath: widget.imagePath,
              itemName: widget.itemName,
              productModel: widget.productModel,
              description: widget.description,
            );
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.itemName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: widget.imagePath,
                      child: Image.asset(
                        widget.imagePath,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        color: btntapped ? Colors.amber : Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            btntapped = !btntapped;
                          });
                        },
                        icon: btntapped
                            ? const Icon(
                                Icons.add,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 