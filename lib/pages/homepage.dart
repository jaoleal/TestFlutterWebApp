import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepage extends StatelessWidget {
  const homepage({super.key, required this.isMinSize});
  final bool isMinSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5)),
          items: [1, 2, 3].map((i) {
            return Builder(builder: ((context) {
              return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: imageReturn(
                    index: i,
                    isMinSize: isMinSize,
                  ));
            }));
          }).toList(),
        ),
      ),
    );
  }
}

class imageReturn extends StatelessWidget {
  const imageReturn({super.key, required this.index, required this.isMinSize});

  final int index;
  final bool isMinSize;

  @override
  Widget build(BuildContext context) {
    double scrhgt = MediaQuery.of(context).size.height;
    double scrwdt = MediaQuery.of(context).size.width;

    double scaleFactor = (scrhgt * scrwdt) * 0.000001;
    double fontsize = scaleFactor * 60;
    if (isMinSize) {
      fontsize = scaleFactor * 60;
    } else {
      fontsize = scaleFactor * 27;
    }

    List imgList = [
      Image.asset(
        'assets/images/la.jpg',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      Image.asset(
        'assets/images/ny.jpg',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      Image.asset(
        'assets/images/chicago.jpg',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    ];

    List<Widget> textList = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Los Angeles',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize,
                    fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('We had the best time playing at Venice Beach!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontsize,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: scrhgt / 8,
              ),
            ],
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'New York',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize,
                    fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('The atmosphere in New York is lorem ipsum.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontsize,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: scrhgt / 8,
              ),
            ],
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Chicago',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize,
                    fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Thank you, Chicago - A night we won\'t forget.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontsize,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: scrhgt / 8,
              ),
            ],
          )
        ],
      )
    ];

    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        fit: StackFit.expand,
        children: [imgList[index - 1], textList[index - 1]],
      ),
    );
  }
}
