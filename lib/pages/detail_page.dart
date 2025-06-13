import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/event.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    CupertinoIcons.back,
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
