import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_store/Controller/cart_controller.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/images.dart';
import 'package:shoes_store/Helpers/navigate.dart';
import 'package:shoes_store/Helpers/size.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';
import 'package:shoes_store/Views/widgets/total_cost.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  CartController controller = Get.find();
  bool valuee = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: SizedBox(
              height: kHieght(context) * .5,
              child: ListView(
                children: [
                  _sectionTitle("Delivery Address"),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _textField("First Name"),
                        _textField("Last Name"),
                        _textField("Address Line 1"),
                        _textField("Address Line 2 (Optional)"),
                        _textField("City"),
                        _textField("Postal/Zip Code"),
                        _textField("Country"),
                        _textField("Phone Number"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  _sectionTitle("Payment Method"),
                  _dropDownField(["Credit Card", "PayPal", "Other"],
                      "Select Payment Method"),

                  // Include fields for credit card if 'Credit Card' is selected
                  // ...

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        activeColor: cBlue,
                        value: valuee, // Add state management here
                        onChanged: (value) {
                          setState(() {
                            valuee = !valuee;
                          });
                        },
                      ),
                      const Expanded(
                          child: Text("I agree to the terms and conditions.")),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TotalCost(
            controller: controller,
            isEmpty: controller.isEmpty(),
            onTap: () {
              if (formKey.currentState!.validate()) {
                // getOff(const BaseView(), context);

                showCustomDialog(context);
                // getOff(const BaseView(), context);
              } else {}
            },
          )
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: cDark),
      ),
    );
  }

  Widget _textField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: cLightGrey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cBlue, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cDark, width: 1.0),
          ),
        ),
      ),
    );
  }

  Widget _dropDownField(List<String> items, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(color: cBlue),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cBlue, width: 2.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cRed, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cBlue, width: 1.0),
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          // Implement logic to handle dropdown change
        },
      ),
    );
  }

  showCustomDialog(context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Lottie.asset(Assets.imagesCheckoutDoneLottie),
              const SizedBox(height: 15),
              Text(
                'Payment Success! '.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Your payment is successful! Feel free to continue shopping or explore our Products.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  controller.deleteAllCart();
                  Get.back();
                  getOff(const BaseView(), context);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: cBlue,
                    minimumSize: const Size(400, 55)),
                child: const Text('Explore More',style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
