import 'package:flutter/material.dart';
import 'package:teleheal_apps/theme/constants.dart';

class ButtonRegister extends StatelessWidget {
  final Function()? onClicked;
  final bool isLoading;
  const ButtonRegister({
    Key? key,
    required this.onClicked,
    required this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ]
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        onPressed: onClicked,
        child: isLoading
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24),
            Text("Loading ...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white 
              ),
            )
          ],
        )
        : const Text("Register",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ),
    );
  }
}