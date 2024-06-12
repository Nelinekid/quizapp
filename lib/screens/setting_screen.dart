import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:quizapp/log_sign.dart'; // Import the LoginPage

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _currentIndex = 3; // Default to Settings tab

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
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingScreen()),
        );
        break;
    }
  }

  void _showSignoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Signout'),
          content: Text('Do you want to signout from this account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Pop dialog with true value
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Use foregroundColor for text color
                backgroundColor: Colors.redAccent.withOpacity(0.1), // Light red hover effect
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Pop dialog with false value
              },
              child: Text('No'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey, // Use foregroundColor for text color
                backgroundColor: Colors.grey.withOpacity(0.1), // Light grey hover effect
              ),
            ),
          ],
        );
      },
    ).then((value) {
      // After dialog is dismissed
      if (value != null && value) {
        // Navigate to login screen and remove all routes from stack
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
              SettingButton(
                title: 'Edit Profile',
                icon: Icons.edit,
                onTap: () {
                  // Navigate to Edit Profile Screen
                },
              ),
              SettingButton(
                title: 'Appearance',
                icon: Icons.color_lens,
                onTap: () {
                  // Navigate to Appearance Screen
                },
              ),
              SettingButton(
                title: 'Signout',
                icon: Icons.exit_to_app,
                onTap: _showSignoutDialog,
                isSignout: true,
              ),
            ],
          ),
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
