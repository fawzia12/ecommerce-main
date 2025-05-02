import 'package:flutter/material.dart';

class Productquantitycounter extends StatefulWidget {
  const Productquantitycounter({super.key, required this.onChange});

  final Function(int) onChange;
  @override
  State<Productquantitycounter> createState() => _ProductquantitycounterState();
}

class _ProductquantitycounterState extends State<Productquantitycounter> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    void _increment() {
      if (_count <= 20) {
        _count++;
        widget.onChange(_count);
        setState(() {});
      }
    }

    void _decrement() {
      if (_count > 1) {
        _count--;
        widget.onChange(_count);
        setState(() {});
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _decrement();
          },
          child: Container(
            height: 26,
            width: 34,
            color: const Color.fromARGB(255, 184, 224, 220),
            child: Icon(Icons.remove, size: 22),
          ),
        ),
        SizedBox(width: 7),
        Text(
          '$_count',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            _increment();
          },
          child: Container(
            height: 26,
            width: 34,
            color: Colors.teal[200],
            child: Icon(Icons.add, size: 22),
          ),
        ),
      ],
    );
  }
}
