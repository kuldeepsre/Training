import 'package:dreambiztech/Components/spacers.dart';
import 'package:dreambiztech/Declarations/Constants/constants.dart';
import 'package:flutter/material.dart';


class SocialSignIn extends StatelessWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBtn("Sign in with Facebook", Colors.blue, Icons.facebook),
        const WidthSpacer(myWidth: 15.5),
        buildBtn("Sign in with Gmail", Colors.red, Icons.mail)
      ],
    );
  }

  Widget buildBtn(String text, Color btnColor, IconData iconData) => Container(

        height: 40,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const WidthSpacer(myWidth: 7.00),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
