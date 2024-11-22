import 'package:chat_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class VoucherWidget extends StatelessWidget {
  const VoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorName.orangeBlur,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.gif_box_sharp, size: 15),
                Expanded(
                    child: Text("Mua toi thieu 199k de nhan qua",
                        textAlign: TextAlign.start)),
                Icon(Icons.arrow_forward_ios, size: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
