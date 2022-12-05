import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/apis.dart';
import '../../constants/constants.dart';
import 'components/coutrypicker.dart';
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
                    await otpGet(mobilenumber: controller.text)
                        .then((value) => {
                              Get.to(VerifyNumber(
                                number: controller.text,
                              ))
                            });
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
