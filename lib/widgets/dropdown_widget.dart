import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatelessWidget {
  DropDownWidget({super.key});

  var items = ['S', 'X', 'L', 'XL'];
  var dropdownValue = "S";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        // Initial Value
        value: dropdownValue,
        focusColor: Colors.grey,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(value: items, child: Text(items));
        }).toList(),
        onChanged: (String? newValue) {
          dropdownValue = newValue!;
        });
  }
}
