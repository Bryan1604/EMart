import 'package:chat_app/gen/colors.gen.dart';
import 'package:chat_app/widgets/counter_widget.dart';
import 'package:chat_app/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (bool? value) {}),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorName.redColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Product Name", style: TextStyle(fontSize: 20)),
                DropDownWidget(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "100.000",
                      style: TextStyle(
                          color: ColorName.redColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      "đ2.000.000",
                      style: TextStyle(
                          color: ColorName.darkFontGrey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: ColorName.darkFontGrey,
                          decorationThickness: 0.7,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.start,
                    ),
                    CounterWidget()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
