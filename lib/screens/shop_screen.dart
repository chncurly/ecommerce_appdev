import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  // MY PRODUCT LIST
  final List<Product> products = [
    Product(id: '1', name: 'Ysl Cushion', price: 1000, image: 'cushion.png'),
    Product(id: '2', name: 'Ysl Eyeglass', price: 1500, image: 'eyeglass.png'),
    Product(id: '3', name: 'Ysl Eyeshadow', price: 500, image: 'eyeshadow.png'),
    Product(id: '4', name: 'Ysl Heels', price: 2000, image: 'heels.png'),
    Product(id: '5', name: 'Ysl lipstick', price: 500, image: 'lipstick.png'),
    Product(id: '6', name: 'Ysl Perfume', price: 500, image: 'perfume.png'),
    Product(id: '7', name: 'Ysl Shoes', price: 3000, image: 'shoes.png'),
    Product(id: '8', name: 'Ysl Wallet', price: 600, image: 'wallet.png'),
    Product(id: '9', name: 'Ysl Watch', price: 4000, image: 'watch.png'),
    Product(id: '10', name: 'Ysl Slippers', price: 500, image: 'slippers.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 32, 32),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 54, 47, 46),
        foregroundColor: Colors.white,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
                icon: const Icon(Icons.shopping_bag),
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 82, 64, 63),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MessageScreen()),
              );
            },
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('ysl2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(product.image, fit: BoxFit.contain),
                      ),
                    ),
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '₱${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              51,
                              48,
                              48,
                            ),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            cart.addToCart(product);
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Success!',
                                message: "${product.name} added to cart",
                                contentType: ContentType.success,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
