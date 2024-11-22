import 'dart:math';

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 3; // Initial value

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) return;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Nút trừ
          InkWell(
              onTap: _decrementCounter,
              child: const Icon(Icons.remove, size: 16)),
          Container(
            height: 25, // Chiều cao của đường kẻ
            width: 1, // Độ dày của đường kẻ
            color: Colors.grey,
          ),
          // Text hiển thị số động

          SizedBox(
            width: 20,
            child: Text(
              '$_counter', // Giá trị động
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),

          // Nút cộng
          Container(
            height: 25, // Chiều cao của đường kẻ
            width: 1, // Độ dày của đường kẻ
            color: Colors.grey,
          ),
          InkWell(
              onTap: _incrementCounter, child: const Icon(Icons.add, size: 16)),
        ],
      ),
    );
  }
}
