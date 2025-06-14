import 'package:flutter/material.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  final List<String> eventCategory = ["Music", "Clothing", "Festival", "Food"];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Screen title bar
                Row(
                  children: [
                    /// Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
          
                    SizedBox(width: MediaQuery.of(context).size.width / 5),
          
                    /// Screen title
                    const Text(
                      "Upload event",
                      style: TextStyle(
                        color: Color(0xff6351ec),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 20),
          
                /// Event image
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.camera_alt_outlined),
                  ),
                ),
          
                const SizedBox(height: 30),
          
                /// Event name title
                const Text(
                  "Event name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          
                const SizedBox(height: 10),
          
                /// Event name field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter event name",
                    ),
                  ),
                ),
          
                const SizedBox(height: 30),
          
                /// Ticket price title
                const Text(
                  "Ticket price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          
                const SizedBox(height: 10),
          
                /// Ticket price field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter price",
                    ),
                  ),
                ),
          
                const SizedBox(height: 30),
          
                /// Event category title
                const Text(
                  "Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          
                const SizedBox(height: 10),
          
                /// Event category dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: eventCategory
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        setState(() {
                          this.value = value;
                        });
                      }),
                      dropdownColor: Colors.white,
                      hint: const Text("Select category"),
                      iconSize: 36,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: value,
                    ),
                  ),
                ),
          
                const SizedBox(height: 30),
          
                /// Event detail title
                const Text(
                  "Event detail",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          
                const SizedBox(height: 10),
          
                /// Event detail field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What will be on that event...",
                    ),
                  ),
                ),
          
                const SizedBox(height: 20),
          
                /// Upload button
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: const BoxDecoration(
                      color: Color(0xff6351ec),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Button text
                        Text(
                          "Upload",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
