import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: cart.isEmpty
          ? const Center(child: Text('Your Cart Is Empty'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    child: Image.asset(
                      cartItem['imageUrl'] as String,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Item?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                              'Are you sure you want to remove this item from your cart?',
                              style: TextStyle(fontSize: 16),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(70, 40),
                                ),
                                child: Text(
                                  'Yes',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(70, 40),
                                ),
                                child: Text(
                                  'No',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    'Size: ${cartItem['size']}',
                  ),
                );
              },
            ),
    );
  }
}
