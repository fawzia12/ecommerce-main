import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Producrcursolslider extends StatefulWidget {
  const Producrcursolslider({super.key});

  @override
  State<Producrcursolslider> createState() => _ProducrcursolsliderState();
}

class _ProducrcursolsliderState extends State<Producrcursolslider> {
  int _selectedpages = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 270,
            onPageChanged: (index, reason) {
              _selectedpages = index;
              setState(() {});
            },
          ),

          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,

                      color: Colors.grey,
                      child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: 3, width: 5),
        Positioned(
          bottom: 9,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                CircleAvatar(
                  radius: 9,
                  backgroundColor:
                      _selectedpages == i ? Colors.cyan[200] : Colors.white,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
