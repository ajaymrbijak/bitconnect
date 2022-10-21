import 'package:bitchat/screens/login/api_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'coutrypicker.dart';
import 'verify_number.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  TextEditingController controller = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  @override
  void initState() {
    super.initState();
    countryCode.text = "+91";
  }

  @override
  Widget build(BuildContext context) {
    print(controller.text);
    return Scaffold(
        resizeToAvoidBottomInset: false,

        // navigationBar: const CupertinoNavigationBar(
        //   middle: Text("Edit Number"),
        //   previousPageTitle: "Back",
        // ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/login.png",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Enter phone number to continue,we will send you OTP to verify",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none),
                ),
              ),
              CountryPicker(
                numcontroller: controller,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(30)),
                child: OutlinedButton(
                  onPressed: () async {
                    otpGet(mobilenumber: controller.text);

                    // try {
                    //   print(countryCode.text + controller.text);
                    //   await FirebaseAuth.instance.verifyPhoneNumber(
                    //     phoneNumber: countryCode.text + controller.text,
                    //     verificationCompleted:
                    //         (PhoneAuthCredential credential) {
                    //       print(credential);
                    //     },
                    //     verificationFailed: (FirebaseAuthException e) {
                    //       print(e);
                    //     },
                    //     codeSent: (String verificationId, int? resendToken) {
                    //       VerifyNumber.verify = verificationId;
                    //       print(VerifyNumber.verify);
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => VerifyNumber(
                    //                     number: controller.text,
                    //                   )));
                    //     },
                    //     codeAutoRetrievalTimeout: (String verificationId) {},
                    //   );
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                  child: const Text(
                    'Request code',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already User?",
                    style: textdeco.copyWith(fontSize: 20),
                  ),
                  TextButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 24, 107, 224),
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
