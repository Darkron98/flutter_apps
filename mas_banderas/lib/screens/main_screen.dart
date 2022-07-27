import 'package:flutter/material.dart';
import '../screens/screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration = const BoxDecoration(
      //main screen background
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
        colors: [
          Color(0xff2C2645),
          Color(0xff202333),
        ],
      ),
    );

    return Scaffold(
      ///backgroundColor: Color(0xff57bcd6),
      body: Stack(
        children: [
          _BackGround(),
          Container(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: const [
                Title(),
                CountryScreen(),
              ],
            ),
          ),
        ],
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
      //logotype style
      fontSize: size.width * 0.275,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 236, 217, 106),
    );
    var textStyle2 = TextStyle(
      //isotype style
      fontSize: size.width * 0.175,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 133, 114, 207),
    );

    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.09),
          Row(
            //app logo
            children: [
              Text('+', style: textStyle1),
              Text('World', style: textStyle2),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: size.height * 0.08),
          const CircleAvatar(
            backgroundImage:
                AssetImage('assets/globe.gif'), //background animation
            radius: 150,
          ),
          Expanded(child: Container()),
          Icon(
            //drag dow indicator
            Icons.keyboard_arrow_down,
            color: Color.fromARGB(255, 53, 46, 83),
            size: size.width * 0.25,
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  //title implementation
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContent();
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround({
    Key? key,
  }) : super(key: key);
  //app background
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0xff2C2645),
        Color(0xff202333),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
          width: size.width,
          alignment: Alignment.topCenter,
        ),
      ],
    );
  }
}
