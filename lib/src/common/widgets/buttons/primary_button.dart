import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? buttonAction;
  const PrimaryButton({super.key, this.label, this.icon, this.buttonAction});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  onClick() {
    widget.buttonAction != null ? widget.buttonAction!() : () {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.orange],
        ),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 245, 157, 1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          onClick();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          ),
        ),
        child: Row(
          children: [
            Text(
              widget.label ?? 'Label',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
