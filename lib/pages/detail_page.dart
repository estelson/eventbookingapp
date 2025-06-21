import 'dart:convert';

import 'package:eventbookingapp/services/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String location;
  final String date;
  final String detail;
  final String price;

  const DetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.date,
    required this.detail,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int ticket = 1;
  double total = 0.0;

  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    total = double.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              /// Event image
              Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 40, left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    /// Event info
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Event title
                          Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          /// Event date
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.date,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color.fromARGB(211, 255, 255, 255),
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),

                          /// Event location
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.location,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color.fromARGB(211, 255, 255, 255),
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// About event title
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "About event",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Event description
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.detail,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Number of tickets
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Number of tickets:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 40),

                /// Quantity container
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      /// Increase button
                      GestureDetector(
                        onTap: () {
                          total = total + double.parse(widget.price);

                          ticket++;

                          setState(() {});
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),

                      /// Quantity
                      Text(
                        ticket.toString(),
                        style: const TextStyle(
                          color: Color(0xff6351ec),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      /// Decrease button
                      GestureDetector(
                        onTap: () {
                          if (ticket > 1) {
                            total = total + double.parse(widget.price);

                            ticket--;
                          }

                          setState(() {});
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Amount and book button session
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Amount
                Text(
                  "Amount: \$${total.toString()}",
                  style: const TextStyle(
                    color: Color(0xff6351ec),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 20),

                /// Book button
                GestureDetector(
                  onTap: () {
                    makePayment(total.toString());
                  },
                  child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff6351ec),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Book now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent?["client_secret"],
              // applePay: true,
              // googlePay: true,
              style: ThemeMode.dark,
              merchantDisplayName: "Estelson",
            ),
          )
          .then((value) {});

      displayPaymentSheet(amount);
    } catch (e, s) {
      debugPrint("");
      debugPrint("");
      debugPrint("---------------------------------------- ERROR: ---------------------------------------------------");
      debugPrint("Exception: $e,\n\nStackTrace: $s");
      debugPrint("---------------------------------------------------------------------------------------------------");
      debugPrint("");
      debugPrint("");
    }
  }

  Future<void> displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        Map<String, dynamic> bookingDetail = {
          "Number": ticket.toString(),
          "Total": total.toString(),
          "Event": widget.name,
          "Image": widget.image,
          "Detail": widget.detail,
          "Location": widget.location,
          "Date": widget.date,
        };

        /// ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment successful")
                        ],
                      ),
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        debugPrint("");
        debugPrint("");
        debugPrint("---------------------------------------- ERROR: ---------------------------------------------------");
        debugPrint("Exception: $error");
        debugPrint("StackTrace: $stackTrace");
        debugPrint("---------------------------------------------------------------------------------------------------");
        debugPrint("");
        debugPrint("");
      });
    } on StripeException catch (e) {
      debugPrint("");
      debugPrint("");
      debugPrint("---------------------------------------- ERROR: ---------------------------------------------------");
      debugPrint("Exception: $e");
      debugPrint("---------------------------------------------------------------------------------------------------");
      debugPrint("");
      debugPrint("");

      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Canceled"),
        ),
      );
    } catch (e) {
      debugPrint("");
      debugPrint("");
      debugPrint("---------------------------------------- ERROR: ---------------------------------------------------");
      debugPrint("Exception: $e");
      debugPrint("---------------------------------------------------------------------------------------------------");
      debugPrint("");
      debugPrint("");
    }
  }

  Future createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {"amount": amount, "currency": currency, "payment_method_types[]": "card"};

      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {"Authorization": "Bearer $secretKey", "Content-Type": "application/x-www-form-urlencoded"},
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      debugPrint("");
      debugPrint("");
      debugPrint("---------------------------------------- ERROR: ---------------------------------------------------");
      debugPrint("Exception on charging user: ${err.toString()}");
      debugPrint("---------------------------------------------------------------------------------------------------");
      debugPrint("");
      debugPrint("");
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (double.parse(amount)) * 100;

    return calculatedAmount.toString();
  }
}
