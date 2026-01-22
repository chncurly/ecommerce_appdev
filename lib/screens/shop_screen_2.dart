import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

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

      //APP BAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 232, 41, 28),
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 40,

            //TEXT FIELD FOR SEARCH
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
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
                    MaterialPageRoute(builder: (_) => CartScreen()),
                  );
                },
                icon: Icon(Icons.shopping_bag),
              ),

              if (cart.itemCount > 0)
                Positioned(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${cart.itemCount}',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MessageScreen()),
              );
            },
            icon: Icon(Icons.message),
          ),
        ],
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.image, width: 100),
              title: Text(product.name),
              subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 35, 32, 32),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  cart.addToCart(product);
                  const snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Done!',
                      message: 'Your order is now added',
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },

                child: Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
