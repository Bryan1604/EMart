import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Cart/widgets/cart_item_list.dart';
import 'package:chat_app/screens/Cart/widgets/cart_purchase_footer.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.greyBackground,
      child: Stack(
        children: [
          CartItemList(cart_store: 3),
          const Positioned(bottom: 0, child: CartPurchaseFooter())
        ],
      ),
    );
  }
}
