import 'package:flutter/material.dart';

class modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const modified_text({Key key, this.text, this.color, this.size,this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle (color: color, fontSize: size,fontWeight: fontWeight));
  }
}