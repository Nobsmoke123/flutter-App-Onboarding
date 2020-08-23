import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
    final int _totalPages = 3;
    final PageController _pageController = PageController(initialPage: 0);
    int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(
              children: [
                  PageView(
                  controller: _pageController,
                  onPageChanged: (int index){
                      setState(() {
                        _currentPage = index;
                      });
                  },
                  children: <Widget>[
                      _buildPageContent('assets/images/1.png', Color(0xFFFF7252), 'Select your location by turning on your device location.'),
                      _buildPageContent('assets/images/2.png', Color(0xFFFFA131), 'Browse our product catalog and popular products.'),
                      _buildPageContent('assets/images/3.png', Color(0xFF3C60FF), 'Add product to your cart and make payment, delivery is instant.'),
                  ],
                ),
                Positioned(
                    bottom: 40,
                    left: MediaQuery.of(context).size.width * .05,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * .9,
                            child: Row(
                                children: <Widget>[
                                    for(int i = 0; i < _totalPages; i++) i == _currentPage ? _buildPageIndicator(true) : _buildPageIndicator(false),

                                    Spacer(),

                                    if(_currentPage != 2)
                                    InkWell(
                                        onTap: (){
                                            setState(() {
                                                _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                                            });
                                        },
                                        child: Container(
                                            height: 60,
                                            alignment: Alignment.center,
                                            child: Text('Skip',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                ),),
                                        ),
                                    ),

                                    if(_currentPage == 2)
                                    InkWell(
                                        onTap: (){
                                            setState(() {
                                                _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                                            });
                                        },
                                        child: Container(
                                            height: 60,
                                            alignment: Alignment.center,
                                            child: Text('Start',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                ),),
                                        ),
                                    )
                                ],
                            ),
                        ),
                    ],
                )),
              ]
            ),
        ),
    );
  }

  Widget _buildPageContent(String image, Color color, String body){
      return Container(
          decoration: BoxDecoration(
              color: color
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Center(
                      child: Image.asset(image),
                  ),

                  SizedBox(height: 50,),

                  Text(
                      body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 1.6,
                          fontSize: 24
                      ),
                  ),
              ],
          ),
      );
  }

  Widget _buildPageIndicator(bool isCurrentPage){
      return AnimatedContainer(
          duration: Duration(milliseconds: 350),
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: isCurrentPage ? 18 : 10,
          width: isCurrentPage? 18 : 10,
          decoration: BoxDecoration(color: isCurrentPage? Colors.white : Colors.white54, borderRadius: BorderRadius.all(Radius.circular(20)) ),
      );
  }
}
