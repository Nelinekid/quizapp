import 'package:flutter/material.dart';
import 'package:quizapp/screens/setting_screen.dart';
import 'package:quizapp/models/models.dart';
import 'home_screen.dart';
// ignore: unused_import
import 'package:quizapp/log_sign.dart'; // Import the LoginPage

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int _currentIndex = 2; // Default to Rankings tab

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen(userNameOrEmail: 'User')),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RankingScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SettingScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rankings'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/question_mark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
              RankData(
                index: '1',
                url: Image.asset('assets/images/HEAD.JPG'),
                name: 'Spida Mitchell', 
                points: '1000pts',
                onTap: (){},
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Note',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class _rank extends StatelessWidget {
  const _rank({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Top Scorers',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {})
      ],
    );
  }
}
