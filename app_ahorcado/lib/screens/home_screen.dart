import 'package:app_ahorcado/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageTitle(),
          SizedBox(height: 200),
          Column(
            children: [
              Text(
                'Puntuación',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '000000000',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          FloatingActionButton(
            elevation: 0,
            onPressed: () => Navigator.pushNamed(context, 'game'),
            child: Icon(
              Icons.play_arrow,
              size: 50,
            ),
          ),
          SizedBox(height: 100),
          Column(
            children: [
              Text('Nivel'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_left),
                  Icon(Icons.image),
                  Icon(Icons.image),
                  Icon(Icons.image),
                  Icon(Icons.arrow_right),
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
