import 'package:chat_app/screens/Cart/widgets/cart_item_store.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  CartItemList({super.key, required this.cart_store});
  final int cart_store;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: cart_store,
          itemBuilder: (context, index) {
            if (index == cart_store - 1) {
              return const SizedBox(height: 170);
            }
            return const CartItemStore();
          },
        ));
  }
}
