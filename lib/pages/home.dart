import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffe3e6ff),
              Color(0xfff1f3ff),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  "Sobradinho - Brasília(DF)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Hello, Estelson!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "There are 20 events\naround your location.",
              style: TextStyle(
                color: Color(0xff6351ec),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// Search bar
            Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_outlined),
                  border: InputBorder.none,
                  hintText: "Search an event...",
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                children: [
                  /// Music
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/musical.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Music",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),

                  /// Clothing
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/tshirt.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Clothing",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),

                  /// Festival
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/confetti.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Festival",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),

                  /// Food
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/dish.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Food",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Upcoming events list
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Upcoming events title
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Upcoming events suffix
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Upcoming events items
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/event.jpg",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Aug\n24",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dua Lipa Concert",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "\$50.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6351ec),
                    ),
                  ),
                ),
              ],
            ),

            const Row(
              children: [
                Icon(Icons.location_on),
                Text(
                  "Mumbai, India",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
