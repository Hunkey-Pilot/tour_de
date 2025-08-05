import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import '../../../../app/app_colors.dart';
import '../../../common/widget/show_snack_bar_message.dart';

class BookingUserInformationScreen extends StatefulWidget {
  const BookingUserInformationScreen({super.key});

  static final String name = '/booking-user-info';

  @override
  State<BookingUserInformationScreen> createState() => _BookingUserInformationScreenState();
}

class _BookingUserInformationScreenState extends State<BookingUserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 580,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 28,),
                      Text("Give Your Information",style: TextStyle(
                        fontSize: 24,
                      ),),
                      SizedBox(height: 8,),
                      formField("Full Name"),
                      SizedBox(height: 8,),
                      formField("Journey Date"),
                      SizedBox(height: 8,),
                      formField("Email"),
                      SizedBox(height: 8,),
                      formField("Mobile No"),
                      SizedBox(height: 8,),
                      formField("Additional Requirement")

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: _onTapProceedToPaymentButton,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),
                  child: Text(
                    "Proceed to Payment",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget formField(String hintText) {
    return TextFormField(
           maxLines: (hintText== 'Additional Requirement') ? 6 : 1,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.themeColor),
              ),
            ),
          );
  }
  Future<void> _onTapProceedToPaymentButton() async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            multi_card_name: "visa,master,bkash",
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "fsaas687ad80f0e192",
            store_passwd: "fsaas687ad80f0e192@ssl",
            total_amount: 25000,
            tran_id: "TXN25252DDFF250"));

    final result = await sslcommerz.payNow();

    if (result.status == "VALID") {
      showSnackBarMessage(context, "Payment Success");
    } else if (result.status == "FAILED") {
      showSnackBarMessage(context, "Payment Failed. Something went wrong during payment.");
    } else {
      showSnackBarMessage(context, "Payment cancelled or unknown status.");
    }
  }

}
