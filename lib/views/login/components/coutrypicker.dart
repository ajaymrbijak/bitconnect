import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CountryPicker extends StatefulWidget {
  CountryPicker({super.key, required this.numcontroller});
  TextEditingController numcontroller;

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: IntlPhoneField(
          controller: widget.numcontroller,
          textAlign: TextAlign.left,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            setState(() {
              widget.numcontroller.text = phone.number.toString();
              widget.numcontroller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.numcontroller.text.length));
            });
          },
        ));
  }
}
