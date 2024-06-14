import 'package:flutter/material.dart' show BorderRadius, BoxDecoration, BuildContext, CircleAvatar, Colors, Container, EdgeInsets, GestureDetector, MouseRegion, Row, State, StatefulWidget, Text, TextStyle, VoidCallback, Widget, immutable;
import 'package:flutter/widgets.dart';

@immutable
class RankData extends StatefulWidget{

  const RankData({
    required this.index,
    required this.url, 
    required this.name, 
    required this.points,
    required this.onTap,
  });

  final String index;
  final String url;
  final String name;
  final String points;
  final VoidCallback onTap;

  @override
  _RankDataState createState() => _RankDataState();
}

class _RankDataState extends State<RankData> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.grey[800] : Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  widget.index,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.url),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  widget.points,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
