import 'package:flutter/material.dart';
import 'package:testapp/pages/homepage.dart';
import 'newpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expandMore = false;
  @override
  Widget build(BuildContext context) {
    bool isMinSize = MediaQuery.of(context).size.width < 770;
    double scrwdth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Stack(
          children: [
            Container(
                color: Colors.black,
                height: 50,
                width: double.infinity,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.black,
                          width: 770,
                          child:
                              const TabBar(indicatorColor: Colors.white, tabs: [
                            Tab(
                              text: 'HOME',
                            ),
                            Tab(
                              text: 'BAND',
                            ),
                            Tab(
                              text: 'TOUR',
                            ),
                            Tab(
                              text: 'CONTACT',
                            ),
                          ]),
                        ),
                      ],
                    ))),
            Positioned(
                left: 770,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      expandMore = !expandMore;
                    });
                  },
                  child: AnimatedContainer(
                      color: Colors.black,
                      duration: const Duration(milliseconds: 200),
                      height: expandMore ? 200 : 50,
                      width: expandMore ? 300 : 30,
                      child: const Text('a')),
                )),
            Positioned.fill(
                top: 50,
                child: TabBarView(
                  children: [
                    homepage(
                      isMinSize: isMinSize,
                    ),
                    NovaTela(
                      text: '2',
                    ),
                    NovaTela(
                      text: '3',
                    ),
                    NovaTela(
                      text: scrwdth.toString(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
