import 'package:flutter/material.dart';

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
                  child:  Column(
                    children: [
                      /// Increase button
                      GestureDetector(
                        onTap: () {
                          ticket++;

                          setState(() {

                          });
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
                          if(ticket > 1) {
                            ticket--;
                          }

                          setState(() {

                          });
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
                  "Amount: \$${widget.price}",
                  style: const TextStyle(
                    color: Color(0xff6351ec),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 20),

                /// Book button
                Container(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
