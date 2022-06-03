import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
        colors: [
          Color(0xff2C2645),
          Color(0xff2C2645),
        ],
      ),
    );

    return Scaffold(
      ///backgroundColor: Color(0xff57bcd6),
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Page1(),
            Page2(),
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle1 = TextStyle(
      fontSize: 94,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 236, 217, 106),
    );
    var textStyle2 = TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 133, 114, 207),
    );

    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.09),
          Row(
            children: [
              Text('+', style: textStyle1),
              Text('Flags', style: textStyle2),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            color: Color.fromARGB(255, 95, 82, 148),
            size: 115,
          ),
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff2C2645),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.33),
          Image(
            image: AssetImage('assets/globe_2.gif'),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        MainContent(),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2C2645),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'main_screen');
              },
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 95, 82, 148),
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
