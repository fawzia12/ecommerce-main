
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedpages=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 200,onPageChanged: (index, reason) {
            _selectedpages=index;
            setState(() {
              
            });
          },),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent[100],borderRadius: BorderRadius.circular(10)),
                      child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: 3,width: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           for(int i=0;i<5;i++)
           CircleAvatar(radius: 9,
           backgroundColor: _selectedpages==i?Colors.cyan[200]:Colors.blueGrey),
          ],
        ),
      
      ],
    );
  }
}
