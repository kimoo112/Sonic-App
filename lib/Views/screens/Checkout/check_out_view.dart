import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Controller/cart_controller.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/navigate.dart';
import '../../../Helpers/size.dart';
import '../Base/base_screen.dart';
import '../../widgets/checkout_text_field.dart';
import '../../widgets/get_back_arrow.dart';
import '../../widgets/total_cost.dart';

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
        leading: const GetBackArrow(),
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
                        textField("First Name"),
                        textField("Last Name"),
                        textField("Address Line 1"),
                        textField("Address Line 2 (Optional)"),
                        textField("City"),
                        textField("Postal/Zip Code"),
                        textField("Country"),
                        textField("Phone Number"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _sectionTitle("Payment Method"),
                  _dropDownField(["Credit Card", "PayPal", "Other"],
                      "Select Payment Method"),
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
                child: const Text(
                  'Explore More',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
