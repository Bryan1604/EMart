import 'package:chat_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPurchaseFooter extends StatelessWidget {
  const CartPurchaseFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.screenWidth,
        height: 165,
        color: ColorName.whiteColor,
        child: Column(
          children: [
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.volcano_rounded),
                  const SizedBox(width: 4),
                  const Expanded(
                      child: Text("Shopee Voucher",
                          style: TextStyle(fontSize: 16))),
                  InkWell(
                    onTap: () {},
                    child: const Row(children: [
                      Text("Chon hoac nhap ma"),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ]),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.money),
                  const SizedBox(width: 4),
                  const Text("Ban chua chon san pham",
                      style: TextStyle(fontSize: 16)),
                  const Icon(Icons.question_mark_outlined),
                  const Expanded(
                      child: SizedBox(
                    width: double.infinity,
                  )),
                  Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeTrackColor: Colors.grey,
                    activeColor: ColorName.darkFontGrey,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Row(
              children: [
                const Checkbox(
                  value: false,
                  onChanged: null,
                ),
                const Expanded(
                  child: Text(
                    "Tat ca",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                const Text(
                  "Tong thanh toan: 0d",
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: ColorName.redColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Mua hang (0)",
                      style: TextStyle(
                          color: ColorName.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
