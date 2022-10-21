import 'package:bitchat/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class UserData extends StatelessWidget {
  UserData({super.key});
  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Enter Username",
          style: textdeco,
        ),
        Padding( 
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
          child: CupertinoTextField(
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 27),
            maxLength: 20,
            controller: _text,
            keyboardType: TextInputType.name,
            autofillHints: const <String>[AutofillHints.name],
          ),
        )
      ],
    ));
  }
}
