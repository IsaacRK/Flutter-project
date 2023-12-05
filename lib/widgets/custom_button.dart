import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonTitle;
  final String? iconPath;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressed;

  const LoginButton({
    super.key,
    required this.buttonColor,
    required this.buttonTitle,
    this.iconPath,
    required this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(buttonColor)),
        child: SizedBox(
          width: 230,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) Image.asset(iconPath!),
              const SizedBox(width: 8),
              Text(buttonTitle, style: TextStyle(color: textColor)),
            ],
          ),
        ));
  }
}

class RounddedButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonTitle;
  final double borderRadius;

  const RounddedButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonTitle,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          //do something
        },
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Color(0xFF357AD4)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)))),
        child: SizedBox(
            width: (MediaQuery.of(context).size.width * 1) - 60,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(buttonTitle,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800)),
            ])));
  }
}
