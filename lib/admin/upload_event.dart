import 'dart:io';

import 'package:eventbookingapp/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  final List<String> eventCategory = ["Music", "Clothing", "Festival", "Food"];

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 00);

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
                selectedImage != null
                    ? Center(
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Image.file(
                            selectedImage!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            getImage();
                          },
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
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
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
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
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

                /// Event date/time
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pickDate();
                      },
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      DateFormat("yyyy-MM-dd").format(selectedDate),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        _pickTime();
                      },
                      child: const Icon(
                        Icons.alarm,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      formatTimeOfDay(selectedTime),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                  child: TextField(
                    controller: detailController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "What will be on that event...",
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Upload button
                GestureDetector(
                  onTap: () async {
                    String addId = randomAlphaNumeric(10);
                    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);

                    final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

                    var downloadUrl = await (await task).ref.getDownloadURL();
                    String id = randomAlphaNumeric(10);

                    Map<String, dynamic> uploadEvent = {
                      "Image": downloadUrl,
                      "Name": nameController.text.trim(),
                      "Price": priceController.text.trim(),
                      "Category": value,
                      "Date": DateFormat("yyyy-MM-dd").format(selectedDate),
                      "Time": formatTimeOfDay(selectedTime),
                      "Detail": detailController.text.trim(),
                    };

                    await DatabaseMethods().addEvent(uploadEvent, id).then((onValue) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Event uploaded successfully!!!",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );

                      setState(() {
                        selectedImage = null;
                        nameController.text = "";
                        priceController.text = "";
                        value = null;
                        selectedDate = DateTime.now();
                        selectedTime = const TimeOfDay(hour: 10, minute: 00);
                        detailController.text = "";
                      });
                    });
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

  /// /////////////////////
  /// Auxiliary methods ///
  /// /////////////////////

  /// Get image from gallery
  Future<void> getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);

    setState(() {});
  }

  /// Pick date function
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  /// Format time to desired format with leading zero
  String formatTimeOfDay(TimeOfDay time) {
    final DateTime now = DateTime.now();

    /// Convert TimeOfDay to DateTime
    final DateTime dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return DateFormat("hh:mm a").format(dateTime);
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
