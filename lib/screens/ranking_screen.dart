import 'package:flutter/material.dart';
import 'package:quizapp/screens/setting_screen.dart';
import 'home_screen.dart';
// ignore: unused_import
import 'package:quizapp/log_sign.dart'; // Import the LoginPage

class RankingScreen extends StatefulWidget {
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
          MaterialPageRoute(builder: (context) => HomeScreen(userNameOrEmail: 'User')),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RankingScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rankings'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/question_mark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SettingButton(
              //   title: '4th Position',
              //   icon: Icons.edit,
              //   onTap: () {
              //     // Navigate to Edit Profile Screen
              //   },
              // ),
              SettingButton(
                // image: Image.asset('assets/images/HEAD.JPG'),
                title: '4th Position',
                icon: Icons.person,
                onTap: () {
                  // Navigate to Edit Profile Screen
                },
              ),
              SettingButton(
                // image: Image.asset('assets/images/HEAD.JPG'),
                title: '5th Position',
                icon: Icons.person,
                onTap: () {
                  // Navigate to Appearance Screen
                },
              ),
              SettingButton(
                // image: Image.asset('assets/images/HEAD.JPG'),
                title: '6th Position',
                icon: Icons.person,
                onTap: () {

                },
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
        items: [
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

class SettingButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSignout;

  SettingButton({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSignout = false,
  });

  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.grey[800] : Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.isSignout ? Colors.red : Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isSignout ? Colors.red : Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
