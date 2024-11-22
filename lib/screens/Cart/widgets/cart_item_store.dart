import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/screens/Cart/widgets/cart_item.dart';
import 'package:chat_app/screens/Cart/widgets/cart_store_header.dart';
import 'package:chat_app/screens/Cart/widgets/voucher_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemStore extends StatelessWidget {
  const CartItemStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorName.whiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              const CartStoreHeader(storeName: "MR.Heron", isMall: true),
              const VoucherWidget(),
              const SizedBox(height: 4),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(height: 4),
                    CartItem(),
                    SizedBox(height: 4),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider())
                  ]);
                },
              ),
              const Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "Giam 300000 phi van chuyen don toi thieu 0 dong, giam....",
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 15),
                ],
              )
            ]),
          ),
        ),
        // CartItem()
      ],
    );
  }
}
