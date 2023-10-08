import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  final double? size;
  const Custom_button({
    Key? key,
    required this.text,
    required this.ontap,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Text(
        text,
        style: TextStyle(
            color: color == null ? Colors.black : Colors.white, fontSize: size),
      ),
    );
  }
}

////without round
class noRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  const noRoundButton({
    super.key,
    required this.text,
    required this.ontap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.white : Colors.black,
        ),
      ),
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        animationDuration: Duration(seconds: 1),
        backgroundColor: color,
      ),
    );
  }
}
