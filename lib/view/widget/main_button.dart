import 'package:flutter/material.dart';
import 'default_text.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  const MainButton({Key? key,required this.text, required this.onTap, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     child: SizedBox(
          height: height,
          width: 100,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              child: Center(
                child: DefaultText(
                  text:text,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
    );
  }
}
