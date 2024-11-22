import 'package:chat_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CartStoreHeader extends StatelessWidget {
  const CartStoreHeader({
    super.key,
    this.status = false,
    this.isMall = false,
    this.storeName,
  });
  final bool status;
  final bool isMall;
  final String? storeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Checkbox(
          value: false,
          onChanged: null,
        ),
        InkWell(
          onTap: () {},
          child: Row(children: [
            if (isMall)
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: ColorName.redColor,
                  ),
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        "Mail",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorName.whiteColor),
                      ))),
            const SizedBox(width: 4),
            Text(
              storeName ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 10),
          ]),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: const Text("Sua", textAlign: TextAlign.end),
          ),
        )
      ],
    );
  }
}
