import 'package:bitchat/constants/constants.dart';
import 'package:bitchat/screens/login/api_otp.dart';
import 'package:bitchat/screens/login/user_credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

enum Status { waiting, error }

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key, required this.number});
  final String number;
  static String verify = '';

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  var status = Status.waiting;
  TextEditingController textEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.number);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = '';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'images/otpui.png',
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Phone Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "We have sent a OTP to the ${widget.number} number !",
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Pinput(
              length: 6,
              onChanged: (value) {
                code = value;
              },
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    try {
                      valiOtp(mobilenumber: widget.number, otp: code);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserData()));
                      // PhoneAuthCredential credential =
                      //     PhoneAuthProvider.credential(
                      //         verificationId: VerifyNumber.verify,
                      //         smsCode: code);
                      // await auth.signInWithCredential(credential);

                    } catch (e) {
                      print("Wrong Otp : $e");
                    }
                  },
                  child: const Text("Verify Phone Number")),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Didn't receive code?",
                  style: textdeco.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7)),
                ),
                TextButton(
                    onPressed: () async {
                      // verifyMobileNumber();
                    },
                    child: Text(
                      "RESEND OTP",
                      style: textdeco.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 18, 137, 234)
                              .withOpacity(0.7)),
                    ))
              ],
            )
          ],
        )
            // ],
            // ),
            ),
      ),
    );
  }
}
