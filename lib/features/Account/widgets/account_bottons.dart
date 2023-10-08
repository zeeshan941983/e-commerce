import 'package:flutter/material.dart';

class AccountBotton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const AccountBotton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: ontap,
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
