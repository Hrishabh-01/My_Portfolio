import 'package:flutter/material.dart';

class LetterByLetterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Letter by Letter Animation')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LetterByLetterText(
            text: 'Hello World!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            duration: Duration(milliseconds: 1500),
          ),
        ),
      ),
    );
  }
}

class LetterByLetterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const LetterByLetterText({
    Key? key,
    required this.text,
    this.style = const TextStyle(fontSize: 16),
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _LetterByLetterTextState createState() => _LetterByLetterTextState();
}

class _LetterByLetterTextState extends State<LetterByLetterText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.text.characters.map((char) {
            final index = widget.text.split('').indexOf(char);
            final animation = Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  (index / widget.text.length),
                  ((index + 1) / widget.text.length),
                  curve: Curves.easeOut,
                ),
              ),
            );

            return FadeTransition(
              opacity: animation,
              child: Text(
                char,
                style: widget.style,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
